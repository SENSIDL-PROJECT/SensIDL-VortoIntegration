package de.fzi.sensidl.language.generator.factory.javatest

import de.fzi.sensidl.design.sensidl.dataRepresentation.Data
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataRange
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataSet
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataType
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversion
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversionWithInterval
import de.fzi.sensidl.design.sensidl.dataRepresentation.ListData
import de.fzi.sensidl.design.sensidl.dataRepresentation.MeasurementData
import de.fzi.sensidl.design.sensidl.dataRepresentation.NonMeasurementData
import de.fzi.sensidl.language.generator.GenerationUtil
import de.fzi.sensidl.language.generator.SensIDLConstants
import de.fzi.sensidl.language.generator.SensIDLOutputConfigurationProvider
import de.fzi.sensidl.language.generator.factory.IDTOGenerator
import java.util.HashMap
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.EList

/**
 * Java test code generator for the SensIDL Model. 
 * Code will be generated by running the {@code generate()}-Method
 * 
 * @author Sven Eckhardt
 * @author Pawel Bielski 
 * @author Max Peters 
 * @author Fabian Scheytt 
 */
 
class JavaTestDTOGenerator implements IDTOGenerator {
	private static Logger logger = Logger.getLogger(JavaTestDTOGenerator)
	private List<DataSet> dataSet
	private boolean createProject = false
		
	/**
	 * The constructor calls the constructor of the superclass to set a
	 * list of DataSet-elements.
	 * @param newDataSet - represents the list of DataSet-elements.
	 */
	new(List<DataSet> newDataSet) {
		this.dataSet = newDataSet
	}
	
	/**
	 * The constructor calls the constructor of the superclass to set a
	 * list of DataSet-elements and a member-variable.
	 * @param newDataSet - represents the list of DataSet-elements.
	 * @param createProject - indicates if a project should be created.
	 */
	new(List<DataSet> newDataSet,boolean createProject) {
		this.dataSet = newDataSet
		this.createProject = createProject
	}

	/**
	 * Generates the .java file for the tests of each data set.
	 * @see IDTOGenerator#generate()
	 */
	override generate() {
		logger.info("Start with code-generation of a java test data transfer object.")
		val filesToGenerate = new HashMap			
		if (createProject) {
			for (d : this.dataSet) {
				filesToGenerate.put("src/de/fzi/sensidl/" + GenerationUtil.getSensorInterfaceName(this.dataSet.get(0).eContainer) +"/" + addFileExtensionTo(GenerationUtil.toNameUpper(d)+"Test"), generateClassBody(GenerationUtil.toNameUpper(d)+"Test", d))
				logger.info("File: " + addFileExtensionTo(GenerationUtil.toNameUpper(d)+"Test") + " was generated in " + SensIDLOutputConfigurationProvider.SENSIDL_GEN)
			}
		} 
		else	{
			for (d : this.dataSet) {
				filesToGenerate.put(addFileExtensionTo(GenerationUtil.toNameUpper(d)+"Test"), generateClassBody(GenerationUtil.toNameUpper(d)+"Test", d))
				logger.info("File: " + addFileExtensionTo(GenerationUtil.toNameUpper(d)+"Test") + " was generated in " + SensIDLOutputConfigurationProvider.SENSIDL_GEN)
			}
		}
		filesToGenerate
	}

	/**
	 * Generates the Classes
	 */
	def generateClassBody(String className, DataSet d) {
		'''
			«IF createProject»
			package de.fzi.sensidl.«GenerationUtil.getSensorInterfaceName(this.dataSet.get(0).eContainer)»;
			«ELSE»
			package «GenerationUtil.getSensorInterfaceName(this.dataSet.get(0).eContainer)».«className»;
			«ENDIF» 
			
			import static org.junit.Assert.assertTrue;
			import java.lang.reflect.Method;
			import org.junit.After;
			import org.junit.Assert;
			import org.junit.Before;
			import java.util.ArrayList;
			import java.util.List;
			import «d.sensorDataDescription.sensorInterface.name».«d.name.toFirstUpper».«d.name.toFirstUpper»;
			«d.usedDataSets.imports»
			
			
			/**
			 * Test cases for «className.substring(0,className.length-4)».java
			 * @generated
			 */
			public class «className» {
				private «d.name.toFirstUpper» «d.name.toFirstLower»;

				@Before public void setUp() {
					«d.name.toFirstLower» = new «d.name.toFirstUpper»();
				}

				@After public void tearDown() {
					«d.name.toFirstLower» = null;
				}

				«d.generateConstructorTest»
				«d.generateSetterTests»
				«d.generateInitialValueTests»
				«d.generateExcludedMethodsTest»
				«d.generateRangeAdjustmentTests»
				«d.generateLinearDataConversionTests»
				«d.generateLinearDataConversionWithIntervalTests»
				«d.generateListTests»
			}
		 '''
	}
	
// ------------------------------ Test Methods ------------------------------
	
	/**
	 * Generates test cases for all list datas of a data set.
	 */	
	def generateListTests(DataSet d) {
		'''
			«FOR data : d.data.filter(ListData)»
				/**
				 * test setter of list «data.name.toFirstUpper»
				 * @generated
				 */	
				@org.junit.Test public void test«data.name.toFirstUpper»ListSetter() {
					List<«data.toTypeName»> list = new ArrayList<«data.toTypeName»>();
					«d.name.toFirstLower».set«data.name.toFirstUpper»(list);
					assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(list));
					
					}
				
				/**
				 * test add to list «data.name.toFirstUpper»
				 * @generated
				 */	
				@org.junit.Test public void test«data.name.toFirstUpper»AddToList() {
					«d.name.toFirstLower».add«data.name.toFirstUpper»(«data.dataType.getNumberWithCast(data.minValue)»);
					«d.name.toFirstLower».add«data.name.toFirstUpper»(«data.dataType.getNumberWithCast(data.maxValue)»);
					assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»(«data.dataType.getNumberWithCast(data.minValue)») == «data.dataType.getNumberWithCast(data.minValue)»);
					assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»(«data.dataType.getNumberWithCast(data.maxValue)») == «data.dataType.getNumberWithCast(data.maxValue)»);
				}
				
			«ENDFOR»
		'''		
	}
	
	/**
	 * Generates test cases for all measurement datas with linear data conversion with interval of a data set.
	 */	
	def generateLinearDataConversionWithIntervalTests(DataSet d) {
		'''
			«FOR data : d.data.filter(MeasurementData)»
				«FOR adj : data.adjustments»
					«IF adj instanceof LinearDataConversionWithInterval»
						«IF !data.excludedMethods.contains("setter")»
						/**
						 * Testcase for setter with linear data conversion with interval of «data.name.toFirstUpper»
						 * testing conversion
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithLinearDataConversionWithIntervalPositiv() {
							«data.toTypeName» minValue = «data.dataType.getNumberWithCast(adj.fromInterval.lowerBound)»;
							«data.toTypeName» maxValue = «data.dataType.getNumberWithCast(adj.fromInterval.upperBound)»;
							«data.toTypeName» midValue = «data.dataType.getNumberWithCast((adj.fromInterval.upperBound-adj.fromInterval.lowerBound)/2+adj.fromInterval.lowerBound)»;
							«adj.dataType.toTypeName» minValueAdj = («adj.dataType.toSimpleTypeName») («getLinearDataConversionWithInterval(adj.fromInterval.lowerBound,adj.fromInterval.lowerBound,adj.fromInterval.upperBound,adj.toInterval.lowerBound,adj.toInterval.upperBound)»
							«adj.dataType.toTypeName» maxValueAdj = («adj.dataType.toSimpleTypeName») («getLinearDataConversionWithInterval(adj.fromInterval.upperBound,adj.fromInterval.lowerBound,adj.fromInterval.upperBound,adj.toInterval.lowerBound,adj.toInterval.upperBound)»
							«adj.dataType.toTypeName» midValueAdj = («adj.dataType.toSimpleTypeName») («getLinearDataConversionWithInterval(data.dataType.toDataType((adj.fromInterval.upperBound-adj.fromInterval.lowerBound)/2+adj.fromInterval.lowerBound).doubleValue,adj.fromInterval.lowerBound,adj.fromInterval.upperBound,adj.toInterval.lowerBound,adj.toInterval.upperBound)»
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(minValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(minValueAdj));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(maxValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(maxValueAdj));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(midValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(midValueAdj));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
						}
						
						/**
						 * Testcase for setter with linear data conversion with interval of «data.name.toFirstUpper»
						 * testing overflow
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithLinearDataConversionWithIntervalNegativHigher() {
							«IF adj.fromInterval.upperBound+1<=Double.valueOf(data.maxValue.toString)»
								«data.toTypeName» value = «data.dataType.getNumberWithCast(adj.fromInterval.upperBound + 1)»;
								«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(value);
								«IF !data.excludedMethods.contains("getter")»
									assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»() == null);
								«ELSE»
									//no getter for «data.name.toFirstUpper»
								«ENDIF»
							«ELSE»
								//test value «adj.fromInterval.upperBound + 1» causes overflow
							«ENDIF»
						}
						
						/**
						 * Testcase for setter with linear data conversion with interval of «data.name.toFirstUpper»
						 * testing underflow
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithLinearDataConversionWithIntervalNegativLower() {
							«IF adj.fromInterval.lowerBound-1>=Double.valueOf(data.minValue.toString)»
								«data.toTypeName» value = «data.dataType.getNumberWithCast(adj.fromInterval.lowerBound - 1)»;
								«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(value);
								«IF !data.excludedMethods.contains("getter")»
									assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»() == null);
								«ELSE»
									//no getter for «data.name.toFirstUpper»
								«ENDIF»
							«ELSE»
								//«System.out.println(adj.fromInterval.lowerBound-1+" "+Double.valueOf(data.minValue.toString)+ " " +((adj.fromInterval.lowerBound-1) <Double.valueOf(data.minValue.toString)))»«(adj.fromInterval.lowerBound-1)>=Double.valueOf(data.minValue.toString)»«Double.valueOf(data.minValue.toString)» test value «adj.fromInterval.lowerBound - 1» causes underflow
							«ENDIF»
						}
						
						«ELSE»
						/**
						 * excluded SetterWithDataConversion test for «data.name.toFirstUpper»
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»ExcludedSetterWithDataConversion() {
							for (Method m : «d.name.toFirstLower».getClass().getMethods()) {
								Assert.assertNotEquals(m.getName(), "set«data.name.toFirstUpper»WithDataConversion");
							}
						}
						
						«ENDIF»
					«ENDIF»
				«ENDFOR»
			«ENDFOR»
		'''
	}

	/**
	 * Generates test cases for all measurement datas with linear data conversion of a data set.
	 */	
	def generateLinearDataConversionTests(DataSet d) {
		'''
			«FOR data : d.data.filter(MeasurementData)»
				«FOR adj : data.adjustments»
					«IF adj instanceof LinearDataConversion»
						«IF !data.excludedMethods.contains("setter")»
						/**
						 * Testcase for setter with linear data conversion of «data.name.toFirstUpper»
						 * testing conversion
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithLinearDataConversionPositiv() {
							«data.toTypeName» value = «getNumberWithCast(data.dataType,(Double.valueOf(data.maxValue.toString)/(adj.scalingFactor*10))-adj.offset)»;
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(value);
							«IF !data.excludedMethods.contains("getter")»
								Double d = (value * «adj.scalingFactor») + «adj.offset»;
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(d.«data.toTypeName.substring(data.toTypeName.lastIndexOf(".")+1,data.toTypeName.length).toFirstLower.replace("integer","int")»Value()));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
						}
						
						/**
						 * Testcase for setter with linear data conversion of «data.name.toFirstUpper»
						 * testing overflow
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithLinearDataConversionNegativ() {
							«data.toTypeName» value = «getNumberWithCast(data.dataType,Double.valueOf(data.maxValue.toString))»;
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithDataConversion(value);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»() == null);
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
						}
						
						«ELSE»
						/**
						 * excluded SetterWithDataConversion test for «data.name.toFirstUpper»
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»ExcludedSetterWithDataConversion() {
							for (Method m : «d.name.toFirstLower».getClass().getMethods()) {
								Assert.assertNotEquals(m.getName(), "set«data.name.toFirstUpper»WithDataConversion");
							}
						}
						
						«ENDIF»
					«ENDIF»
				«ENDFOR»
			«ENDFOR»
		'''
	}
	
	/**
	 * Generates test cases for all measurement datas with range adjustment of a data set.
	 */	
	def generateRangeAdjustmentTests(DataSet d) {
		'''
			«FOR data : d.data.filter(MeasurementData)»
				«FOR adj : data.adjustments»
					«IF adj instanceof DataRange»
						«IF !data.excludedMethods.contains("setter")»
						/**
						 * Testcase for Setter with Range of «data.name.toFirstUpper»
						 * testing range overflow
						 * @generated
						 */	
						@org.junit.Test (expected = IllegalArgumentException.class) public void test«data.name.toFirstUpper»SetterWithRangeNegativHigher() {
							«IF adj.range.upperBound+1<=Double.valueOf(data.maxValue.toString)»
								«data.toTypeName» value = «data.dataType.getNumberWithCast(adj.range.upperBound + 1)»;
								«d.name.toFirstLower».set«data.name.toFirstUpper»WithRange(value);
								«IF !data.excludedMethods.contains("getter")»
									assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(value));
								«ELSE»
									//no getter for «data.name.toFirstUpper»
								«ENDIF»
							«ELSE»
								//test value «adj.range.upperBound+1» causes overflow
							«ENDIF»
						}
						
						/**
						 * Testcase for setter with range of «data.name.toFirstUpper»
						 * testing range underflow
						 * @generated
						 */	
						@org.junit.Test (expected = IllegalArgumentException.class) public void test«data.name.toFirstUpper»SetterWithRangeNegativLower() {
							«IF adj.range.lowerBound-1>=Double.valueOf(data.minValue.toString)»
								«data.toTypeName» value = «data.dataType.getNumberWithCast(adj.range.lowerBound - 1)»;
								«d.name.toFirstLower».set«data.name.toFirstUpper»WithRange(value);
								«IF !data.excludedMethods.contains("getter")»
									assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(value));
								«ELSE»
									//no getter for «data.name.toFirstUpper»
							«ENDIF»
							«ELSE»
								//test value «adj.range.lowerBound-1» causes underflow
							«ENDIF»

						}
						
						/**
						 * Testcase for setter with range of «data.name.toFirstUpper»
						 * testing with valid values
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»SetterWithRangePositiv() {
							«data.toTypeName» minValue = «data.dataType.getNumberWithCast(adj.range.lowerBound)»;
							«data.toTypeName» maxValue = «data.dataType.getNumberWithCast(adj.range.upperBound)»;
							«data.toTypeName» midValue = «data.dataType.getNumberWithCast((adj.range.upperBound-adj.range.lowerBound)/2+adj.range.lowerBound)»;
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithRange(minValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(minValue));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithRange(midValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(midValue));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
							«d.name.toFirstLower».set«data.name.toFirstUpper»WithRange(maxValue);
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(maxValue));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»
						}
						
						«ELSE»
						/**
						 * excluded SetterWithRange test for «data.name.toFirstUpper»
						 * @generated
						 */	
						@org.junit.Test public void test«data.name.toFirstUpper»ExcludedSetterWithRange() {
							for (Method m : «d.name.toFirstLower».getClass().getMethods()) {
								Assert.assertNotEquals(m.getName(), "set«data.name.toFirstUpper»WithRange");
							}
						}
						
						«ENDIF»
					«ENDIF»
				«ENDFOR»
			«ENDFOR»
		'''
	}
	
	/**
	 * Generates test cases for all excluded methods of a data set.
	 */	
	def generateExcludedMethodsTest(DataSet d) {
		'''
			«FOR data : d.data»
				«FOR method : data.excludedMethods»
					/**
					 * Testcase for excluded «method» of «data.name.toFirstUpper»
					 * @generated
					 */	
					@org.junit.Test public void test«data.name.toFirstUpper»Excluded«method.toFirstUpper»() {
						for (Method m : «d.name.toFirstLower».getClass().getMethods()) {
							«IF method.equals("setter")»
								Assert.assertNotEquals(m.getName(), "set«data.name.toFirstUpper»");
							«ELSEIF method.equals("getter")»
								Assert.assertNotEquals(m.getName(), "get«data.name.toFirstUpper»");
							«ENDIF»
						}
					}
					
				«ENDFOR»
			«ENDFOR»
		'''
	}	
	
	/**
	 * Generates a test case for the constructor of a data set.
	 */	
	def generateConstructorTest(DataSet d) {
		'''
			/**
			 * «d.name.toFirstUpper» constructor test 
			 * @generated
			 */	
			@org.junit.Test public void testConstructor() {
				«FOR data : d.data»
					«IF data instanceof NonMeasurementData»
						«IF !data.constant»
							«data.toTypeName» «data.name» = «data.minValue»«data.dataType.dataTypeExtention»;
						«ENDIF»
					«ELSEIF data instanceof MeasurementData»
						«data.toTypeName» «data.name» = «data.minValue»«data.dataType.dataTypeExtention»;
					«ENDIF»
				«ENDFOR»
				«FOR dataSet : d.usedDataSets»
					«dataSet.name.toFirstUpper» «dataSet.name.toFirstLower» = new «dataSet.name.toFirstUpper»();
				«ENDFOR» 
				«d.name.toFirstLower» = new «d.name.toFirstUpper»(«d.attributesInLine»);
				«FOR data : d.data»
					«IF data instanceof NonMeasurementData»
						«IF !data.constant»
							«IF !data.excludedMethods.contains("getter")»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(«data.name»));
							«ELSE»
								//no getter for «data.name.toFirstUpper»
							«ENDIF»		
						«ENDIF»
					«ELSEIF data instanceof MeasurementData»
						«IF !data.excludedMethods.contains("getter")»
							«IF data.adjustedByLinearDataConversionWithInterval»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»NotAdjusted().equals(«data.name»));
							«ELSE»
								assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(«data.name»));
							«ENDIF»
						«ELSE»
							//no getter for «data.name.toFirstUpper»
						«ENDIF»	
					«ENDIF»
				«ENDFOR»
				«FOR dataSet : d.usedDataSets»
					assertTrue(«d.name.toFirstLower».get«dataSet.name.toFirstUpper»().equals(«dataSet.name.toFirstLower»));
				«ENDFOR»
			}
			
		'''
	}
	
	/**
	 * Generates test cases for the initial value of non measurement datas of a data set.
	 */	
	def generateInitialValueTests(DataSet d) {
		'''
		«FOR data : d.data.filter(NonMeasurementData)»
			«IF data.value!=null»
				/**
				 * «data.name.toFirstUpper» initial value test
				 * @generated
				 */	
				@org.junit.Test public void test«data.name.toFirstUpper»InitialValue() {
					«data.toTypeName» initialValue = «data.toTypeName».valueOf("«data.value»");
					«IF !data.excludedMethods.contains("getter")»
						assertTrue(«d.name.toFirstLower».get«data.name.toFirstUpper»().equals(initialValue));
					«ELSE»
						//no getter for «data.name.toFirstUpper»
					«ENDIF»					
				}
				
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	/**
	 * Generates test cases for setters of the datas of a data set.
	 */	
	def generateSetterTests(DataSet d){	
		'''
		«FOR data : d.data.filter(Data)»
			«IF data instanceof NonMeasurementData»
				«IF data.constant»
					/**
					 * constant data test for «data.name.toFirstUpper»
					 * @generated
					 */	
					@org.junit.Test public void testConstant«data.name.toFirstUpper»() {
						for (Method m : «d.name.toFirstLower».getClass().getMethods()) {
							Assert.assertNotEquals(m.getName(), "set«data.name.toFirstUpper»");
						}
					}
					
				«ELSEIF !data.excludedMethods.contains("setter")»
					«data.setterTest»
				«ENDIF»				
			«ELSEIF data instanceof MeasurementData»
				«IF !data.excludedMethods.contains("setter")»
					«data.setterTest»
				«ENDIF»		
			«ENDIF»
		«ENDFOR»
		«FOR dataSet : d.usedDataSets»
			/**
			 * Testcase for setter of «dataSet.name.toFirstUpper»
			 * @generated
			 */	
			@org.junit.Test public void test«dataSet.name.toFirstUpper»Setter() {
				«dataSet.name.toFirstUpper» «dataSet.name.toFirstLower» = new «dataSet.name.toFirstUpper»();
				«d.name.toFirstLower».set«dataSet.name.toFirstUpper»(«dataSet.name.toFirstLower»);
				assertTrue(«d.name.toFirstLower».get«dataSet.name.toFirstUpper»().equals(«dataSet.name.toFirstLower»));
			}
			
		«ENDFOR»
		'''
	}
	
// ------------------------------ Other Methods ------------------------------
		
	/**
	 * returns the parameters of a constructor of this data set in a single line
	 */
	private def getAttributesInLine(DataSet d){	
		var s="";
		for (data : d.data) {
			if( data instanceof NonMeasurementData) {
				if(!data.constant) {
					s += data.name +","
				}
			}
			else if (data instanceof MeasurementData) {
				s += data.name +","
			}
		}
		for (dataSet : d.usedDataSets) {
				s += dataSet.name.toFirstLower +","
		}
		if(s.empty) {
			return ""
		}
		else {
			return s.substring(0,s.length-1)
		}
	}
		
	/**
	 * returns the imports necessary for the test cases
	 */
	private def getImports(EList<DataSet> dataSets) {
		'''
			«FOR dataSet : dataSets»
				import «dataSet.sensorDataDescription.sensorInterface.name».«dataSet.name.toFirstUpper».«dataSet.name.toFirstUpper»;
			«ENDFOR»
		'''
	}		
		
	/**
	 * generates a setter test for a data
	 */
	private def getSetterTest(Data data) {
		'''
			/**
			 * Testcase for setter of «data.name.toFirstUpper»
			 * @generated
			 */	
			@org.junit.Test public void test«data.name.toFirstUpper»Setter() {
				«data.toTypeName» minValue = «data.minValue»«data.dataType.dataTypeExtention»;
				«data.toTypeName» maxValue = «data.maxValue»«data.dataType.dataTypeExtention»;
				«data.dataSet.name.toFirstLower».set«data.name.toFirstUpper»(minValue);
				«IF !data.excludedMethods.contains("getter")»
					«IF data.adjustedByLinearDataConversionWithInterval»
						assertTrue(«data.dataSet.name.toFirstLower».get«data.name.toFirstUpper»NotAdjusted().equals(minValue));
					«ELSE»
						assertTrue(«data.dataSet.name.toFirstLower».get«data.name.toFirstUpper»().equals(minValue));
					«ENDIF»
				«ELSE»
					//no getter for «data.name.toFirstUpper»
				«ENDIF»
				«data.dataSet.name.toFirstLower».set«data.name.toFirstUpper»(maxValue);
				«IF !data.excludedMethods.contains("getter")»
					«IF data.adjustedByLinearDataConversionWithInterval»
						assertTrue(«data.dataSet.name.toFirstLower».get«data.name.toFirstUpper»NotAdjusted().equals(maxValue));
					«ELSE»
						assertTrue(«data.dataSet.name.toFirstLower».get«data.name.toFirstUpper»().equals(maxValue));
					«ENDIF»
				«ELSE»
					//no getter for «data.name.toFirstUpper»
				«ENDIF»
			}
			
		'''
	}
	
	/**
	 * returns the appropriate simple type name suitable for casting for dataType if necessary
	 */
	private def getNecessaryCast(DataType d){
		return switch (d) {
			case INT8: "(byte) "
			case UINT8: "(byte) "
			case INT16: "(short) "
			case UINT16: "(short) "
			default: ""
		}
	}
		
	/**
	 * returns the appropriate data type extention for numbers in java
	 */
	private def getDataTypeExtention(DataType d) {
		return switch (d) {
			case INT64: "L"
			case UINT64: "L"
			case FLOAT: "F" 
			default: ""
		}
	}
		
	/**
	 * returns the formula of a linear data conversion with interval with appropriate numbers
	 */
	private def getLinearDataConversionWithInterval(Number independentVariable, double oldMin, double oldMax, double newMin, double newMax) {
		'''
		(((«independentVariable.doubleValue()» - «oldMin») * («newMax» - «newMin»)) / («oldMax» - «oldMin»)) + «newMin»);
		'''
	}
			
	/**
	 * returns the formula of a linear data conversion with interval with appropriate numbers
	 */
	private def getNumberWithCast(DataType type,Object number) {
		'''
		«type.necessaryCast»«toDataType(type,Double.valueOf(number.toString))»«type.dataTypeExtention»'''
	}
			
	/**
	 * returns the minimal value of the data type of this data
	 */
	private def getMinValue(Data d) {
		return switch (d.dataType) {
			case INT8: Byte.MIN_VALUE
			case UINT8: Byte.MIN_VALUE
			case INT16: Short.MIN_VALUE
			case UINT16: Short.MIN_VALUE
			case INT32: Integer.MIN_VALUE
			case UINT32: Integer.MIN_VALUE
			case INT64: Long.MIN_VALUE
			case UINT64: Long.MIN_VALUE
			case FLOAT: (-Float.MAX_VALUE)
			case DOUBLE: (-Double.MAX_VALUE)
			case BOOLEAN: false
			case STRING: "\"test\""
			default: ""
		}
	}
				
	/**
	 * returns the maximal value of the data type of this data
	 */
	private def getMaxValue(Data d) {
		return switch (d.dataType) {
			case INT8: Byte.MAX_VALUE
			case UINT8: Byte.MAX_VALUE
			case INT16: Short.MAX_VALUE
			case UINT16: Short.MAX_VALUE
			case INT32: Integer.MAX_VALUE
			case UINT32: Integer.MAX_VALUE
			case INT64: Long.MAX_VALUE
			case UINT64: Long.MAX_VALUE
			case FLOAT: Float.MAX_VALUE
			case DOUBLE: Double.MAX_VALUE
			case BOOLEAN: true
			case STRING: "\"test\""
			default: ""
		}
	}
				
	/**
	 * converts this value to a value of this data type
	 */
	private def toDataType(DataType d, Double value) {
		return switch (d) {
			case INT8: value.byteValue
			case UINT8: value.byteValue
			case INT16: value.shortValue
			case UINT16: value.shortValue
			case INT32: value.intValue
			case UINT32: value.intValue
			case INT64: value.longValue
			case UINT64: value.longValue
			case FLOAT: value.floatValue
			case DOUBLE: value
			default: 0
		}
	}
	
	/**
	 * returns the appropriate simple type name suitable for casting for dataType
	 */
	private def toSimpleTypeName(DataType d){
		return switch (d) {
			case INT8: "byte"
			case UINT8: "byte"
			case INT16: "short"
			case UINT16: "short"
			case INT32: "int"
			case UINT32: "int"
			case INT64: "long"
			case UINT64: "long"
			case FLOAT: "float"
			case DOUBLE: "double"
			case BOOLEAN: "boolean"
			case STRING: "String"
			default: ""
		}
	}
	
	/**
	 * Maps to the corresponding language data type.
	 * @see IDTOGenerator#toTypeName(Data)
	 */
	override toTypeName(Data d) {
		return switch (d.dataType) {
			case INT8: Byte.name
			case UINT8: Byte.name
			case INT16: Short.name
			case UINT16: Short.name
			case INT32: Integer.name
			case UINT32: Integer.name
			case INT64: Long.name
			case UINT64: Long.name
			case FLOAT: Float.name
			case DOUBLE: Double.name
			case BOOLEAN: Boolean.name
			case STRING: String.name
			default: ""
		}
	}
	
	/**
	 * Maps to the corresponding language data type.
	 * @see IDTOGenerator#toTypeName(Data)
	 */
	private def toTypeName(DataType d) {
		return switch (d) {
			case INT8: Byte.name
			case UINT8: Byte.name
			case INT16: Short.name
			case UINT16: Short.name
			case INT32: Integer.name
			case UINT32: Integer.name
			case INT64: Long.name
			case UINT64: Long.name
			case FLOAT: Float.name
			case DOUBLE: Double.name
			case BOOLEAN: Boolean.name
			case STRING: String.name
			default: ""
		}
	}
	
	/**
	 * adds .java to a string
	 */
	override addFileExtensionTo(String ClassName) {
		return ClassName + SensIDLConstants.JAVA_EXTENSION
	}
	
	/**
	 * returns if a data is adjusted by linear data conversion with interval
	 */
	private def isAdjustedByLinearDataConversionWithInterval(Data d) {
		if(d instanceof MeasurementData) {
			return d.adjustments.exists[adj | adj instanceof LinearDataConversionWithInterval]
		}
		return false
	}
}