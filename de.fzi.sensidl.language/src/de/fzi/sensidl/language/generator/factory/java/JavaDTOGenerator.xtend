package de.fzi.sensidl.language.generator.factory.java

import de.fzi.sensidl.design.sensidl.dataRepresentation.Data
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataConversion
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataRange
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataSet
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversion
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversionWithInterval
import de.fzi.sensidl.design.sensidl.dataRepresentation.MeasurementData
import de.fzi.sensidl.design.sensidl.dataRepresentation.NonMeasurementData
import de.fzi.sensidl.language.generator.SensIDLConstants
import de.fzi.sensidl.language.generator.SensIDLOutputConfigurationProvider
import de.fzi.sensidl.language.generator.factory.IDTOGenerator
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import de.fzi.sensidl.design.sensidl.SensorInterface
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataType
import de.fzi.sensidl.language.generator.GenerationUtil

/**
 * Java code generator for the SensIDL Model. 
 * Code will be generated by running the {@code generate()}-Method
 * 
 * @author Sven Eckhardt
 * @author Pawel Bielski 
 * @author Max Peters
 * @author Fabian Scheytt 
 */
 
class JavaDTOGenerator implements IDTOGenerator {
	private static Logger logger = Logger.getLogger(JavaDTOGenerator)
	
	private boolean createEmptyConstructor = true

	private List<DataSet> dataSet
	
	private boolean createProject = false
	
	/**
	 * The constructor calls the constructor of the superclass to set a list of DataSet-elements.
	 * @param newDataSet Represents the list of DataSet-elements.
	 */
	new(List<DataSet> newDataSet) {
		this.dataSet = newDataSet
	}
	
	/**
	 * The constructor calls the constructor of the superclass to set a list of DataSet-elements and a member-variable.
	 * @param newDataSet Represents the list of DataSet-elements.
	 * @param createProject Indicates if a project should be created.
	 */
	new(List<DataSet> newDataSet,boolean createProject) {
		this.dataSet = newDataSet
		this.createProject = createProject
	}

	/**
	 * @see IDTOGenerator#generate()
	 */
	override generate() {
		logger.info("Start with code-generation of a java data transfer object.")
		val filesToGenerate = new HashMap
		
		if (createProject) {
			for (d : this.dataSet) {
				filesToGenerate.put("src/de/fzi/sensidl/" + GenerationUtil.getSensorInterfaceName(this.dataSet.get(0).eContents.filter(Data).get(0).eContainer) +"/" + addFileExtensionTo(GenerationUtil.toNameUpper(d)), generateClassBody(GenerationUtil.toNameUpper(d), d))
				logger.info("File: " + addFileExtensionTo(GenerationUtil.toNameUpper(d)) + " was generated in " + SensIDLOutputConfigurationProvider.SENSIDL_GEN)
			}
		
		} else{
			for (d : this.dataSet) {
				filesToGenerate.put(addFileExtensionTo(GenerationUtil.toNameUpper(d)), generateClassBody(GenerationUtil.toNameUpper(d), d))
				logger.info("File: " + addFileExtensionTo(GenerationUtil.toNameUpper(d)) + " was generated in " + SensIDLOutputConfigurationProvider.SENSIDL_GEN)
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
			package de.fzi.sensidl.«GenerationUtil.getSensorInterfaceName(d.eContents.filter(Data).get(0).eContainer)»;
			 
			«ENDIF» 
			import java.io.BufferedReader;
			import java.io.ByteArrayInputStream;
			import java.io.IOException;
			import java.io.ObjectInputStream;
			import java.io.Serializable;
			import com.google.gson.Gson;
			 
			/**
			 * Data transfer object for «className»
			 *
			 * @generated
			 */
			class «className» {
				
				private static final long serialVersionUID = 1L;
				
				«generateDataFieldsIncludeParentDataSet(d)»
			
				/**
				 * Constructor for the Data transfer object
				 */
				«generateConstructorIncludeParentDataSet(d, className)»
					
				}
				«IF createEmptyConstructor»
				/**
				 * empty constructor for the Data transfer object
				 */
				public «className»(){
				
				}
				«ENDIF»
				
				«generateDataMethodsIncludeParentDataSet(d)»
					
				«d.generateJsonUnmarshal»	
				
				«d.generateByteArrayUnmarshal»	
			}
		 '''
	}
	
	/**
	 * Generates the data fields for this data set including used data sets.
	 */
	def generateDataFieldsIncludeParentDataSet(DataSet d) {
		var dataSet = d
		var dataFieldsString =''''''
		
		while (dataSet!==null) {
			for (data : dataSet.eContents.filter(NonMeasurementData)) {
				dataFieldsString += generateDataFields(data)
				dataFieldsString += System.getProperty("line.separator");
				}
			for (data : dataSet.eContents.filter(MeasurementData)) {
				dataFieldsString += generateDataFields(data)
				dataFieldsString += System.getProperty("line.separator");
				}
			dataSet = dataSet.parentDataSet
		}
		return dataFieldsString
	}
	
	
	/**
	 * Generates the constructor for this data set including used data sets.
	 */
	def generateConstructorIncludeParentDataSet(DataSet d,String className) {
		var dataSet = d
		var constructorString ='''public «className» («d.generateConstructorArgumentsIncludeParentDataSets»){'''
//		while (dataSet!==null) {
//			if(dataSet.parentDataSet!==null) {
//				constructorString +='''«dataSet.generateConstructorArguments», '''
//			}
//			else {
//				constructorString +='''«dataSet.generateConstructorArguments»)'''
//			}
//			dataSet = dataSet.parentDataSet
//		}
//		dataSet = d
		constructorString += System.getProperty("line.separator");
		var measurementDataList = new ArrayList<MeasurementData>
		var nonMeasurementDataList = new ArrayList<NonMeasurementData>
		while (dataSet!==null) {
			measurementDataList.addAll(dataSet.eContents.filter(MeasurementData))
			nonMeasurementDataList.addAll(dataSet.eContents.filter(NonMeasurementData))
			dataSet = dataSet.parentDataSet
		}
		for (data : measurementDataList) {
			constructorString += '''	this.«GenerationUtil.toNameLower(data)» = «IF data.dataType.isUnsigned»(«data.toSimpleTypeName») («GenerationUtil.toNameLower(data)» - «data.toTypeName».MAX_VALUE)«ELSE»«GenerationUtil.toNameLower(data)»«ENDIF»;
			'''
			}
		for (data : nonMeasurementDataList) {
			if (!data.constant) {
				constructorString += '''	this.«GenerationUtil.toNameLower(data)» = «IF data.dataType.isUnsigned»(«data.toSimpleTypeName») («GenerationUtil.toNameLower(data)» - «data.toTypeName».MAX_VALUE)«ELSE»«GenerationUtil.toNameLower(data)»«ENDIF»;
				'''
			}
		}
		return constructorString
	}

	/**
	 * Generates the getter and setter methods for the data of this data set including used data sets.
	 */
	def generateDataMethodsIncludeParentDataSet(DataSet d) {
		var dataSet = d
		var methodsString =''''''
		var measurementDataList = new ArrayList<MeasurementData>
		var nonMeasurementDataList = new ArrayList<NonMeasurementData>
		while (dataSet!==null) {
			measurementDataList.addAll(dataSet.eContents.filter(MeasurementData))
			nonMeasurementDataList.addAll(dataSet.eContents.filter(NonMeasurementData))
			dataSet = dataSet.parentDataSet
		}
	
	
			for (data : measurementDataList) {
				methodsString += generateGetter(data)
				methodsString += System.getProperty("line.separator");
				methodsString += generateSetter(data)
				methodsString += System.getProperty("line.separator");
			}
			for (data : nonMeasurementDataList) {
				methodsString += generateGetter(data)
				methodsString += System.getProperty("line.separator");
				methodsString += generateSetter(data)
				methodsString += System.getProperty("line.separator");
			}
		return methodsString
	}


	/**
	 * Generates the fields for the measurement data
	 */
	def generateDataFields(MeasurementData d) {
		'''
			/*
			«IF d.description != null» * «d.description»
			 * 
			«ENDIF» 
			 * Unit: «d.unit»
			 */
			private «d.toTypeName» «GenerationUtil.toNameLower(d)»;
		'''
	}

	/**
	 * Generates the fields for the non measurement data
	 */
	def generateDataFields(NonMeasurementData d) {
		if (d.constant) {
			'''
				«IF d.description != null»
				 /*
				  *«d.description»
				 «IF d.dataType.isUnsigned» 
				   * (Java has no option for unsigned data types, so if the data has an unsigned 
				   * data type the value is calculated by subtracting the max value from the 
				   * signed data type and adding it again, if it is used.) 
				«ENDIF»
				*/
				«ENDIF» 
				private static final «d.toTypeName» «d.name.toUpperCase» = «IF d.dataType.isUnsigned»(«d.toSimpleTypeName») («d.value» - «d.toTypeName».MAX_VALUE)«ELSE»«IF d.dataType == DataType.STRING»"«d.value»"«ELSE»«d.value»«ENDIF»«ENDIF»;
			'''
		} else {
			'''
				«IF d.description != null»
				 /*
				  *«d.description»
				  */
				«ENDIF» 
				private «d.toTypeName» «GenerationUtil.toNameLower(d)»«IF !d.value.nullOrEmpty» = «IF d.dataType == DataType.STRING»"«d.value»"«ELSE»«d.value»«ENDIF»«ENDIF»;
			'''
		}

	}


	/**
	 * returns the appropriate type name 
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
		}
	}
	/**
	 * returns true if the DataType is an unsigned DataType
	 */
	def isUnsigned(DataType d){
		if (d == DataType.UINT8 || d == DataType.UINT16 || d == DataType.UINT32 ||d == DataType.UINT64 ){
			return true
		}
		return false
	}

	/**
	 * returns the appropriate simple type name suitable for casting
	 */
	def toSimpleTypeName(Data d){
		return d.toTypeName.substring(d.toTypeName.lastIndexOf('.')+1).toLowerCase();
	}

	/**
	 * Generates the Constructor arguments
	 */
	def generateConstructorArgumentsIncludeParentDataSets(DataSet d) {
		// create an ArrayList with all data that is not a constant NonMeasurementData (which will not be constructor arguments)
		var dataList = new ArrayList<Data>();
		var dataSet = d
		
		while (dataSet != null){
			for (data : dataSet.eContents.filter(Data)) {
				if (data instanceof NonMeasurementData) {
					var nmdata = data as NonMeasurementData
					if (!nmdata.constant) {
						dataList.add(data)
					}
				} else {
					dataList.add(data)
				}
			}
			dataSet = dataSet.parentDataSet
		}

		if (dataList.size > 0) {
			var firstElement = dataList.get(0).toTypeName + " " + GenerationUtil.toNameLower(dataList.get(0))
			dataList.remove(0)
			'''«firstElement»«FOR data : dataList», «data.toTypeName» «GenerationUtil.toNameLower(data)»«ENDFOR»'''
		} else {
			createEmptyConstructor = false;
			''''''
		}
	}

	/** 
	 * Generates the Getter Method for the measurement data
	 */
	def generateGetter(MeasurementData d) {
		'''
			/**
			«IF d.dataType.isUnsigned» 
				* (Java has no option for unsigned data types, so if the data has an unsigned 
				* data type the value is calculated by subtracting the max value from the 
				* signed data type and adding it again, if it is used.)
			«ENDIF»
			 * @return the «GenerationUtil.toNameLower(d)»
			 */
			public «d.toTypeName» «d.toGetterName»(){
				return «IF d.dataType.isUnsigned»(«d.toSimpleTypeName») (this.«GenerationUtil.toNameLower(d)» + «d.toTypeName».MAX_VALUE)«ELSE»this.«GenerationUtil.toNameLower(d)»«ENDIF»;
			}
		'''
	}

	/** 
	 * Generates the Getter Method for the non measurement data
	 */
	def generateGetter(NonMeasurementData d) {
		'''
			/**
			«IF d.dataType.isUnsigned» 
				* (Java has no option for unsigned data types, so if the data has an unsigned 
				* data type the value is calculated by subtracting the max value from the 
				* signed data type and adding it again, if it is used.)
			«ENDIF»
			 * @return the «GenerationUtil.toNameLower(d)»
			 */
			public «d.toTypeName» «d.toGetterName»(){
				return «IF d.dataType.isUnsigned»(«d.toSimpleTypeName») («IF d.constant»«d.name.toUpperCase»«ELSE»this.«GenerationUtil.toNameLower(d)»«ENDIF» + «d.toTypeName».MAX_VALUE)«ELSE»this.«IF d.constant»«d.name.toUpperCase»«ELSE»«GenerationUtil.toNameLower(d)»«ENDIF»«ENDIF»;
			}
		'''
	}

	def toGetterName(Data d) {
		'''get«d.name.replaceAll("[^a-zA-Z0-9]", "").toFirstUpper»'''
	}

	/** 
	 * Generates the Setter Method for the measurement data
	 */
	def generateSetter(MeasurementData d) {
			'''
				«IF d.adjustments.empty == false»
				
				«FOR dataAdj : d.adjustments»
				«IF dataAdj instanceof DataRange»
				/**
				 * @param «GenerationUtil.toNameLower(d)»
				 *			the «GenerationUtil.toNameLower(d)» to set
				 */
				public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)»){
					if («GenerationUtil.toNameLower(d)» >= «dataAdj.range.lowerBound» && «GenerationUtil.toNameLower(d)» <= «dataAdj.range.upperBound»)
						this.«GenerationUtil.toNameLower(d)» = «GenerationUtil.toNameLower(d)»;
					else
						throw new IllegalArgumentException("value is out of defined range");	
				} 
				«ELSEIF dataAdj instanceof DataConversion»	
				
				/**
				* @param «GenerationUtil.toNameLower(d)»
				*			the «GenerationUtil.toNameLower(d)» to set
				*/
				public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)») {
					try {
						«d.generateSetterBodyForMeasurementData(dataAdj as DataConversion)»
					} catch (IllegalArgumentException e) {
						//Do something
					}
				}
«««				«IF dataAdj instanceof DataConversion»						
«««					«IF dataAdj instanceof LinearDataConversion»
«««					/**
«««					 * @param «GenerationUtil.toNameLower(d)»  
«««					 *			the «GenerationUtil.toNameLower(d)» to set
«««					 */
«««					public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)»){
«««						
«««						this.«GenerationUtil.toNameLower(d)» =  «GenerationUtil.toNameLower(d)» * («d.toSimpleTypeName») «dataAdj.scalingFactor» + («d.toSimpleTypeName») «dataAdj.offset»;
«««					} 
«««					«ELSE»
«««						«IF dataAdj instanceof LinearDataConversionWithInterval»
«««						/**
«««						 * @param «GenerationUtil.toNameLower(d)»  
«««						 *			the «GenerationUtil.toNameLower(d)» to set
«««						 */
«««						public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)»){
«««							if («GenerationUtil.toNameLower(d)» >= «dataAdj.fromInterval.lowerBound» && «GenerationUtil.toNameLower(d)» <= «dataAdj.fromInterval.upperBound»){												
«««								
«««								«d.toTypeName» oldMin = («d.toSimpleTypeName») «dataAdj.fromInterval.lowerBound»;
«««								«d.toTypeName» oldMax = («d.toSimpleTypeName») «dataAdj.fromInterval.upperBound»;
«««								«d.toTypeName» newMin = («d.toSimpleTypeName») «dataAdj.toInterval.lowerBound»;
«««								«d.toTypeName» newMax = («d.toSimpleTypeName») «dataAdj.toInterval.upperBound»;
«««								
«««								this.«GenerationUtil.toNameLower(d)» = («d.toSimpleTypeName») ((((«GenerationUtil.toNameLower(d)» - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin);
«««							}
«««							else
«««								throw new IllegalArgumentException("value is out of defined source Interval");
«««						} 		
«««						«ENDIF»
«««					«ENDIF»
				«ENDIF»				
				«ENDFOR»
					
				«ELSE»
					/**
					 * @param «GenerationUtil.toNameLower(d)»  
					 *			the «GenerationUtil.toNameLower(d)» to set
					 */
					public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)»){
						
						this.«GenerationUtil.toNameLower(d)» = «IF d.dataType.isUnsigned»(«d.toSimpleTypeName») («GenerationUtil.toNameLower(d)» - «d.toTypeName».MAX_VALUE)«ELSE»«GenerationUtil.toNameLower(d)»«ENDIF»;
					} 
				«ENDIF»
				''' 

	}
	
	dispatch def generateSetterBodyForMeasurementData(MeasurementData data, LinearDataConversion conversion) {
		'''
			final double offset = «conversion.offset»;
			final double scalingFactor = «conversion.scalingFactor»;
			
			this.«GenerationUtil.toNameLower(data)» = («data.toSimpleTypeName») «GenerationUtil.getSensorInterfaceName(data.eContainer)»«SensIDLConstants.UTILITY_CLASS_NAME».«SensIDLConstants.LINEAR_CONVERSION_METHOD_NAME»(«GenerationUtil.toNameLower(data)», scalingFactor, offset);
		'''
	}
	
	dispatch def generateSetterBodyForMeasurementData(MeasurementData data, LinearDataConversionWithInterval conversion) {
		'''
			«data.toTypeName» oldMin = («data.toSimpleTypeName») «conversion.fromInterval.lowerBound»;
			«data.toTypeName» oldMax = («data.toSimpleTypeName») «conversion.fromInterval.upperBound»;
			«data.toTypeName» newMin = («data.toSimpleTypeName») «conversion.toInterval.lowerBound»;
			«data.toTypeName» newMax = («data.toSimpleTypeName») «conversion.toInterval.upperBound»;
			
			this.«GenerationUtil.toNameLower(data)» = («data.toSimpleTypeName») «GenerationUtil.getSensorInterfaceName(data.eContainer)»«SensIDLConstants.UTILITY_CLASS_NAME».«SensIDLConstants.LINEAR_CONVERSION_WITH_INTERVAL_METHOD_NAME»(«GenerationUtil.toNameLower(data)», oldMin, oldMax, newMin, newMax);
		'''
	}

	/** 
	 * Generates the Setter Method for the non measurement data
	 */
	def generateSetter(NonMeasurementData d) {
		if (d.constant) {
			'''
				// no setter for constant value
			'''
		} else {
			'''
				/**
				«IF d.dataType.isUnsigned» 
				 * (Java has no option for unsigned data types, so if the data has an unsigned 
				 * data type the value is calculated by subtracting the max value from the 
				 * signed data type and adding it again, if it is used.)
				«ENDIF»
				 * @param «GenerationUtil.toNameLower(d)»
				 *			the «GenerationUtil.toNameLower(d)» to set
				 */
				public void «d.toSetterName»(«d.toTypeName» «GenerationUtil.toNameLower(d)»){
					this.«GenerationUtil.toNameLower(d)» = «IF d.dataType.isUnsigned»(«d.toSimpleTypeName») («GenerationUtil.toNameLower(d)» - «d.toTypeName».MAX_VALUE)«ELSE»«GenerationUtil.toNameLower(d)»«ENDIF»;
				} 
			'''
		}
	}

	def toSetterName(Data d) {
		'''set«d.name.replaceAll("[^a-zA-Z0-9]", "").toFirstUpper»'''
	}
	
	def generateJsonUnmarshal(DataSet d){
		'''
		/**
		 * Alternative method responsible for deserializing the received
		 * JSON-formatted L stage from sensor.
		 * 
		 * @param dataset
		 *            the dataset to unmarshall incoming from sensor side in a JSON
		 *            format
		 * @return L unmarshalled L structure
		 */
		public «GenerationUtil.toNameUpper(d)» unmarshal«GenerationUtil.toNameUpper(d)» (BufferedReader dataset) { 
			
			Gson gson = new Gson();
			BufferedReader br = dataset;
			«GenerationUtil.toNameUpper(d)» obj = gson.fromJson(br, «GenerationUtil.toNameUpper(d)».class);
			return obj;
		}
		'''
	}
	
	def generateByteArrayUnmarshal(DataSet d){
		'''
		/**
		 * Method responsible for deserializing the received byte array
		 * representation of L from sensor.
		 * 
		 * @param dataset
		 *            the dataset to unmarshall incoming from sensor side as a byte
		 *            array
		 * @return L unmarshalled L structure
		 * @throws IOException
		 * @throws ClassNotFoundException
		 */
		public «GenerationUtil.toNameUpper(d)» unmarshal«GenerationUtil.toNameUpper(d)»(byte[] dataset) throws IOException, ClassNotFoundException {
			
			ByteArrayInputStream in = new ByteArrayInputStream(dataset);
			ObjectInputStream ois = null;
			ois = new ObjectInputStream(in);
			Object o = ois.readObject();
			«GenerationUtil.toNameUpper(d)» «GenerationUtil.toNameLower(d)» = («GenerationUtil.toNameUpper(d)») o; // TODO: Ensure the type conversion is valid
			in.close();
			if (in != null) {
				ois.close();
			}
			return «GenerationUtil.toNameLower(d)»;
		}
		'''
	}
	
	override addFileExtensionTo(String ClassName) {
		return ClassName + SensIDLConstants.JAVA_EXTENSION
	}
}