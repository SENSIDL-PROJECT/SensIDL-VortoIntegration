package de.fzi.sensidl.language.generator.factory.c

import de.fzi.sensidl.design.sensidl.dataRepresentation.Data
import de.fzi.sensidl.design.sensidl.dataRepresentation.DataSet
import de.fzi.sensidl.language.generator.factory.IDTOGenerator
import java.util.List

/**
* C code generator for the SensIDL Model. 
* Code will be generated by running the {@code generate()}-Method
*/
abstract class CDTOGenerator implements IDTOGenerator {
	protected List<DataSet> dataSets
	
	/**
	 * The constructor calls the constructor of the superclass to set a
	 * list of DataSet-elements.
	 * @param newDataSet - represents the list of DataSet-elements.
	 */
	new(List<DataSet> newDataSet) {
		this.dataSets = newDataSet
	}
	
	/**
	 * Maps to the corresponding language data type.
	 * @see IDTOGenerator#toTypeName(Data)
	 */
	override String toTypeName(Data data) {
		DataTypes.getDataTypeBy(data.dataType)
	}
}