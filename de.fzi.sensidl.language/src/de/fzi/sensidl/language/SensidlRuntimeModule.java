/*
 * generated by Xtext
 */
package de.fzi.sensidl.language;

import org.eclipse.xtext.conversion.IValueConverterService;

import de.fzi.sensidl.language.generator.ISensidlCodeGenerator;
import de.fzi.sensidl.language.generator.SensidlPseudoCodeGenerator;
import de.fzi.sensidl.language.converters.SensIDLValueConverterService;

/**
 * Das RuntimeModule für Guice.
 * <p>
 * Bindet den {@link IValueConverterService} und den {@link SensidlPseudoCodeGenerator} für SensIDL.
 * @see {@link com.google.inject.Module}
 */
public class SensidlRuntimeModule extends de.fzi.sensidl.language.AbstractSensidlRuntimeModule {
	@Override
	public Class<? extends IValueConverterService> bindIValueConverterService() {
		return SensIDLValueConverterService.class;
	}
	
	/**
	 * Bindet den entsprechenden Code-Generator. In diesem Prototypen wird
	 * der {@link SensidlPseudoCodeGenerator} gebunden.
	 * @return {@link SensidlPseudoCodeGenerator}.class
	 */
	public Class<? extends ISensidlCodeGenerator> bindISensidlCodeGenerator() {
		return SensidlPseudoCodeGenerator.class;
	}
}
