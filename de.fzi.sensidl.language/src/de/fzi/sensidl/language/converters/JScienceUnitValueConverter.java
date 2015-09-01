/**
 * 
 */
package de.fzi.sensidl.language.converters;

import javax.measure.unit.Unit;

import org.eclipse.xtext.conversion.IValueConverter;
import org.eclipse.xtext.conversion.ValueConverterException;
import org.eclipse.xtext.nodemodel.INode;

/**
 * @author scheerer
 *
 */
public class JScienceUnitValueConverter implements IValueConverter<Unit> {

	@Override
	public Unit toValue(String string, INode node)
			throws ValueConverterException {
		if (string == null || string == "") {
			return null;
		}
		return ((Unit) node).valueOf(string);
	}

	@Override
	public String toString(Unit value) throws ValueConverterException {
		if (value == null) {
			return null;
		}
		return value.toString();
	}

}
