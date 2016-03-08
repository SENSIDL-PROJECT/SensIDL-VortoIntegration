package de.fzi.sensidl.language.generator.factory.csharp

import de.fzi.sensidl.design.sensidl.dataRepresentation.Data
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataSet
import de.fzi.sensidl.language.generator.SensIDLConstants
import de.fzi.sensidl.language.generator.factory.IDTOGenerator
import java.util.List
import org.apache.log4j.Logger
import java.util.HashMap
import de.fzi.sensidl.language.generator.GenerationUtil
import de.fzi.sensidl.language.generator.SensIDLOutputConfigurationProvider
import de.fzi.sensidl.design.sensidl.dataRepresentation.NonMeasurementData
import de.fzi.sensidl.design.sensidl.dataRepresentation.MeasurementData
import java.util.ArrayList
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataType
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataRange
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataConversion
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversion
import de.fzi.sensidl.design.sensidl.dataRepresentation.LinearDataConversionWithInterval

/**
* CSharp code generator for the SensIDL Model. 
* Code will be generated by running the {@code generate()}-Method
* @author Nathalie Hipp
*/
class CSharpDTOGenerator implements IDTOGenerator {
	private static Logger logger = Logger.getLogger(CSharpDTOGenerator)
	
	private boolean createEmptyConstructor = true
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
	 * The constructor calls the constructor of the superclass to set a list of DataSet-elements and a member-variable.
	 * @param newDataSet Represents the list of DataSet-elements.
	 * @param createProject Indicates if a project should be created.
	 */
	new(List<DataSet> newDataSet,boolean createProject) {
		this.dataSet = newDataSet
		this.createProject = createProject
	}
	

	/**
	 * Generates the .cs file for each data transfer object.
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
			using Gson;
			using System;
			
			/// <summary>
			/// Data transfer object for «className»
			/// 
			/// </summary>
			class «className» 
			{
				private long SerialVersionUid = 1L;
				
				private GeneratedCodeAttribute generatedCodeAttribute = new GeneratedCodeAttribute("SensIDLCodeGenerator", SerialVersionUid);
				
				«generateDataFieldsIncludeParentDataSet(d)»
				/// <summary>
				/// Constructor for the Data transfer object
				/// </summary>
				«generateConstructorIncludeParentDataSet(d, className)»	
				}
				
				«IF createEmptyConstructor»
				/// <summary>
				/// empty constructor for the Data transfer object
				/// </summary>
				public «className»()
				{
				}
				«ENDIF»
				
				«generateDataMethodsIncludeParentDataSet(d)»

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
		var constructorString ='''
		public «className» («d.generateConstructorArgumentsIncludeParentDataSets»)
		{'''
		constructorString += System.getProperty("line.separator");
		var measurementDataList = new ArrayList<MeasurementData>
		var nonMeasurementDataList = new ArrayList<NonMeasurementData>
		while (dataSet!==null) {
			measurementDataList.addAll(dataSet.eContents.filter(MeasurementData))
			nonMeasurementDataList.addAll(dataSet.eContents.filter(NonMeasurementData))
			dataSet = dataSet.parentDataSet
		}
		for (data : measurementDataList) {
			constructorString += '''	this.«GenerationUtil.toNameLower(data)» = «GenerationUtil.toNameLower(data)»;
			'''
			}
		for (data : nonMeasurementDataList) {
			if (!data.constant) {
				constructorString += '''	this.«GenerationUtil.toNameLower(data)» = «GenerationUtil.toNameLower(data)»;
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
				methodsString += generateProperties(data)
				methodsString += System.getProperty("line.separator");
			}
			for (data : nonMeasurementDataList) {
				methodsString += generateProperties(data)
				methodsString += System.getProperty("line.separator");
			}
		return methodsString
	}


	/**
	 * Generates the fields for the measurement data
	 */
	def generateDataFields(MeasurementData d) {
		'''
			/// <summary>
			«IF d.description != null» /// «d.description»
			«ENDIF» 
			/// Unit: «d.unit»
			/// </summary>
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
				/// <summary> 
				/// «d.description»
				/// </summary>
				«ENDIF» 
				private «d.toTypeName» «toPropertyName(d)» = «IF d.dataType == DataType.STRING»"«d.value»"«ELSE»«d.value»«ENDIF»;
			'''
		} else {
			'''
				«IF d.description != null»
				 /// <summary>
				 /// «d.description»
				 /// </summary>
				«ENDIF» 
				private «d.toTypeName» «GenerationUtil.toNameLower(d)»«IF !d.value.nullOrEmpty» = «IF d.dataType == DataType.STRING»"«d.value»"«ELSE»«d.value»«ENDIF»«ENDIF»;
			'''
		}

	}


	/**
	 * Maps to the corresponding language data type.
	 * @see IDTOGenerator#toTypeName(Data)
	 */
	override toTypeName(Data d) {
		return switch (d.dataType) {
			case INT8: "byte"
			case UINT8: "byte"
			case INT16: "short"
			case UINT16: "ushort"
			case INT32: "int"
			case UINT32: "uint"
			case INT64: "long"
			case UINT64: "ulong"
			case FLOAT: "float"
			case DOUBLE: "double"
			case BOOLEAN: "bool"
			case STRING: "string"
		}
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
	def generateProperties(MeasurementData d) {
		'''
		«IF d.adjustments.empty == false»				
		«FOR dataAdj : d.adjustments»
		«IF dataAdj instanceof DataRange»
			///
			/// <param name="«GenerationUtil.toNameLower(d)»"> </param>
			///	<returns>«GenerationUtil.toNameLower(d)»</returns>
			///
			public «d.toTypeName» «d.toPropertyName»()
			{
				get { return «GenerationUtil.toNameLower(d)»; }
				set {
					if (value >= «dataAdj.range.lowerBound» && value <= «dataAdj.range.upperBound»)
						«GenerationUtil.toNameLower(d)» = value;
					else
						throw new IllegalArgumentException("value is out of defined range");	
					}
			} 		
		«ENDIF»
		«IF dataAdj instanceof DataConversion»
			«IF dataAdj instanceof LinearDataConversion»
				///
				/// <param name="«GenerationUtil.toNameLower(d)»"> </param>
				///	<returns>«GenerationUtil.toNameLower(d)»</returns>
				///
				public «d.toTypeName» «d.toPropertyName»(){
					get { return «GenerationUtil.toNameLower(d)»; }
					set { «GenerationUtil.toNameLower(d)» = value *  «dataAdj.scalingFactor» +  «dataAdj.offset»;}	
			«ENDIF»
			«IF dataAdj instanceof LinearDataConversionWithInterval»
				///
				/// <param name="«GenerationUtil.toNameLower(d)»"> </param>
				///	<returns>«GenerationUtil.toNameLower(d)»</returns>
				///
				public «d.toPropertyName»() 
				{
					get { return «GenerationUtil.toNameLower(d)»; }
					set {
						try {
							«d.generateSetterBodyForMeasurementData(dataAdj as DataConversion)»
						} catch (IllegalArgumentException e) {
							//Do something
						}
					}
				}
			«ENDIF»			
		«ENDIF»			
		«ENDFOR»					
		«ELSE»
		///
		/// <param name="«GenerationUtil.toNameLower(d)»"> </param>
		///	<returns>«GenerationUtil.toNameLower(d)»</returns>
		///
		public «d.toTypeName» «d.toPropertyName»()
		{
			get { return «GenerationUtil.toNameLower(d)»; }
			set { «GenerationUtil.toNameLower(d)» = value; }
		}
		«ENDIF»	
		'''
	}

	/** 
	 * Generates the Getter Method for the non measurement data
	 */
	def generateProperties(NonMeasurementData d) {
		'''
			«IF d.constant»
			///
			///	<returns>«GenerationUtil.toNameLower(d)»</returns>
			///
			public «d.toTypeName» «d.toPropertyName»()
			{
				get { return «IF d.constant»«toPropertyName(d)»«ELSE»«GenerationUtil.toNameLower(d)»«ENDIF»; }
			}
			«ELSE»
			///
			/// <param name="«GenerationUtil.toNameLower(d)»"> </param>
			///	<returns>«GenerationUtil.toNameLower(d)»</returns>
			///
			public «d.toTypeName» «d.toPropertyName»()
			{
				get { return «GenerationUtil.toNameLower(d)»; }
				set { «GenerationUtil.toNameLower(d)» = value; }
			}
			«ENDIF»	
		'''
	}

	def toPropertyName(Data d) {
		'''«d.name.replaceAll("[^a-zA-Z0-9]", "").toFirstUpper»'''
	}
	
	dispatch def generateSetterBodyForMeasurementData(MeasurementData data, LinearDataConversion conversion) {
		'''
			double offset = «conversion.offset»;
			double scalingFactor = «conversion.scalingFactor»;
			«GenerationUtil.toNameLower(data)» = («data.toSimpleTypeName») «GenerationUtil.getSensorInterfaceName(data.eContainer)»«SensIDLConstants.UTILITY_CLASS_NAME».«SensIDLConstants.LINEAR_CONVERSION_METHOD_NAME»(«GenerationUtil.toNameLower(data)», scalingFactor, offset);
		'''
	}
	
	dispatch def generateSetterBodyForMeasurementData(MeasurementData data, LinearDataConversionWithInterval conversion) {
		'''
			«data.toTypeName» oldMin = («data.toSimpleTypeName») «conversion.fromInterval.lowerBound»;
			«data.toTypeName» oldMax = («data.toSimpleTypeName») «conversion.fromInterval.upperBound»;
			«data.toTypeName» newMin = («data.toSimpleTypeName») «conversion.toInterval.lowerBound»;
			«data.toTypeName» newMax = («data.toSimpleTypeName») «conversion.toInterval.upperBound»;
			«GenerationUtil.toNameLower(data)» = ((((value - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin);
		'''
	}
	
	/**
	 * Adds the file extension.
	 * @see IDTOGenerator#addFileExtensionTo(String)
	 */
	override addFileExtensionTo(String ClassName) {
		return ClassName + SensIDLConstants.CSharp_EXTENSION;

	}
	
	
}