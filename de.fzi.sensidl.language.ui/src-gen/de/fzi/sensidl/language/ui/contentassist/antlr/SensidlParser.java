/*
* generated by Xtext
*/
package de.fzi.sensidl.language.ui.contentassist.antlr;

import java.util.Collection;
import java.util.Map;
import java.util.HashMap;

import org.antlr.runtime.RecognitionException;
import org.eclipse.xtext.AbstractElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.AbstractContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.FollowElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;

import com.google.inject.Inject;

import de.fzi.sensidl.language.services.SensidlGrammarAccess;

public class SensidlParser extends AbstractContentAssistParser {
	
	@Inject
	private SensidlGrammarAccess grammarAccess;
	
	private Map<AbstractElement, String> nameMappings;
	
	@Override
	protected de.fzi.sensidl.language.ui.contentassist.antlr.internal.InternalSensidlParser createParser() {
		de.fzi.sensidl.language.ui.contentassist.antlr.internal.InternalSensidlParser result = new de.fzi.sensidl.language.ui.contentassist.antlr.internal.InternalSensidlParser(null);
		result.setGrammarAccess(grammarAccess);
		return result;
	}
	
	@Override
	protected String getRuleName(AbstractElement element) {
		if (nameMappings == null) {
			nameMappings = new HashMap<AbstractElement, String>() {
				private static final long serialVersionUID = 1L;
				{
					put(grammarAccess.getDataModelAccess().getAlternatives_6(), "rule__DataModel__Alternatives_6");
					put(grammarAccess.getNamedElementAccess().getAlternatives(), "rule__NamedElement__Alternatives");
					put(grammarAccess.getRepresentationAccess().getAlternatives_0(), "rule__Representation__Alternatives_0");
					put(grammarAccess.getRepresentationAccess().getAlternatives_4(), "rule__Representation__Alternatives_4");
					put(grammarAccess.getDatafieldAccess().getAlternatives(), "rule__Datafield__Alternatives");
					put(grammarAccess.getVariableDataAccess().getAlternatives(), "rule__VariableData__Alternatives");
					put(grammarAccess.getCalculatedAccess().getAlternatives_0(), "rule__Calculated__Alternatives_0");
					put(grammarAccess.getDataConstraintAccess().getAlternatives(), "rule__DataConstraint__Alternatives");
					put(grammarAccess.getEndianessAccess().getAlternatives(), "rule__Endianess__Alternatives");
					put(grammarAccess.getGenerationLanguageAccess().getAlternatives(), "rule__GenerationLanguage__Alternatives");
					put(grammarAccess.getTypeAccess().getAlternatives(), "rule__Type__Alternatives");
					put(grammarAccess.getDataModelAccess().getGroup(), "rule__DataModel__Group__0");
					put(grammarAccess.getDataModelAccess().getGroup_9(), "rule__DataModel__Group_9__0");
					put(grammarAccess.getOptionsAccess().getGroup(), "rule__Options__Group__0");
					put(grammarAccess.getOptionsAccess().getGroup_1(), "rule__Options__Group_1__0");
					put(grammarAccess.getOptionsAccess().getGroup_1_0(), "rule__Options__Group_1_0__0");
					put(grammarAccess.getOptionsAccess().getGroup_1_1(), "rule__Options__Group_1_1__0");
					put(grammarAccess.getOptionsAccess().getGroup_1_2(), "rule__Options__Group_1_2__0");
					put(grammarAccess.getRepresentationAccess().getGroup(), "rule__Representation__Group__0");
					put(grammarAccess.getRepresentationAccess().getGroup_7(), "rule__Representation__Group_7__0");
					put(grammarAccess.getRepresentationAccess().getGroup_8(), "rule__Representation__Group_8__0");
					put(grammarAccess.getMeasuredDataAccess().getGroup(), "rule__MeasuredData__Group__0");
					put(grammarAccess.getMeasuredDataAccess().getGroup_3(), "rule__MeasuredData__Group_3__0");
					put(grammarAccess.getMeasuredDataAccess().getGroup_6(), "rule__MeasuredData__Group_6__0");
					put(grammarAccess.getMeasuredDataAccess().getGroup_7(), "rule__MeasuredData__Group_7__0");
					put(grammarAccess.getNonMeasuredDataAccess().getGroup(), "rule__NonMeasuredData__Group__0");
					put(grammarAccess.getNonMeasuredDataAccess().getGroup_5(), "rule__NonMeasuredData__Group_5__0");
					put(grammarAccess.getNonMeasuredDataAccess().getGroup_6(), "rule__NonMeasuredData__Group_6__0");
					put(grammarAccess.getConstantDataAccess().getGroup(), "rule__ConstantData__Group__0");
					put(grammarAccess.getConstantDataAccess().getGroup_4(), "rule__ConstantData__Group_4__0");
					put(grammarAccess.getConstantDataAccess().getGroup_5(), "rule__ConstantData__Group_5__0");
					put(grammarAccess.getConstantDataAccess().getGroup_6(), "rule__ConstantData__Group_6__0");
					put(grammarAccess.getCalculatedAccess().getGroup(), "rule__Calculated__Group__0");
					put(grammarAccess.getCalculatedAccess().getGroup_6(), "rule__Calculated__Group_6__0");
					put(grammarAccess.getCalculatedAccess().getGroup_9(), "rule__Calculated__Group_9__0");
					put(grammarAccess.getCalculatedAccess().getGroup_10(), "rule__Calculated__Group_10__0");
					put(grammarAccess.getCalculatedAccess().getGroup_11(), "rule__Calculated__Group_11__0");
					put(grammarAccess.getParameterAccess().getGroup(), "rule__Parameter__Group__0");
					put(grammarAccess.getParameterAccess().getGroup_2(), "rule__Parameter__Group_2__0");
					put(grammarAccess.getDatastructureAccess().getGroup(), "rule__Datastructure__Group__0");
					put(grammarAccess.getDatastructureAccess().getGroup_4(), "rule__Datastructure__Group_4__0");
					put(grammarAccess.getDatastructureAccess().getGroup_5(), "rule__Datastructure__Group_5__0");
					put(grammarAccess.getDataRangeAccess().getGroup(), "rule__DataRange__Group__0");
					put(grammarAccess.getDataRangeAccess().getGroup_4(), "rule__DataRange__Group_4__0");
					put(grammarAccess.getDataRangeAccess().getGroup_5(), "rule__DataRange__Group_5__0");
					put(grammarAccess.getDataAdaptionAccess().getGroup(), "rule__DataAdaption__Group__0");
					put(grammarAccess.getDataAdaptionAccess().getGroup_8(), "rule__DataAdaption__Group_8__0");
					put(grammarAccess.getDataAdaptionAccess().getGroup_9(), "rule__DataAdaption__Group_9__0");
					put(grammarAccess.getBoundAccess().getGroup(), "rule__Bound__Group__0");
					put(grammarAccess.getDOUBLEAccess().getGroup(), "rule__DOUBLE__Group__0");
					put(grammarAccess.getDOUBLEAccess().getGroup_1(), "rule__DOUBLE__Group_1__0");
					put(grammarAccess.getDataModelAccess().getOptionsAssignment_4(), "rule__DataModel__OptionsAssignment_4");
					put(grammarAccess.getDataModelAccess().getRepresentationsAssignment_6_0(), "rule__DataModel__RepresentationsAssignment_6_0");
					put(grammarAccess.getDataModelAccess().getDatafieldsAssignment_6_1(), "rule__DataModel__DatafieldsAssignment_6_1");
					put(grammarAccess.getDataModelAccess().getTransmitAssignment_8(), "rule__DataModel__TransmitAssignment_8");
					put(grammarAccess.getDataModelAccess().getTransmitAssignment_9_1(), "rule__DataModel__TransmitAssignment_9_1");
					put(grammarAccess.getOptionsAccess().getEndianessAssignment_1_0_2(), "rule__Options__EndianessAssignment_1_0_2");
					put(grammarAccess.getOptionsAccess().getSensorLanguageAssignment_1_1_3(), "rule__Options__SensorLanguageAssignment_1_1_3");
					put(grammarAccess.getOptionsAccess().getReceiverLanguageAssignment_1_2_3(), "rule__Options__ReceiverLanguageAssignment_1_2_3");
					put(grammarAccess.getRepresentationAccess().getNameAssignment_1(), "rule__Representation__NameAssignment_1");
					put(grammarAccess.getRepresentationAccess().getByteCountAssignment_3(), "rule__Representation__ByteCountAssignment_3");
					put(grammarAccess.getRepresentationAccess().getTypeAssignment_6(), "rule__Representation__TypeAssignment_6");
					put(grammarAccess.getRepresentationAccess().getDescriptionAssignment_7_2(), "rule__Representation__DescriptionAssignment_7_2");
					put(grammarAccess.getRepresentationAccess().getIDAssignment_8_2(), "rule__Representation__IDAssignment_8_2");
					put(grammarAccess.getMeasuredDataAccess().getNameAssignment_2(), "rule__MeasuredData__NameAssignment_2");
					put(grammarAccess.getMeasuredDataAccess().getScaleAssignment_3_1(), "rule__MeasuredData__ScaleAssignment_3_1");
					put(grammarAccess.getMeasuredDataAccess().getUnitAssignment_3_2(), "rule__MeasuredData__UnitAssignment_3_2");
					put(grammarAccess.getMeasuredDataAccess().getRepresentationAssignment_5(), "rule__MeasuredData__RepresentationAssignment_5");
					put(grammarAccess.getMeasuredDataAccess().getDescriptionAssignment_6_2(), "rule__MeasuredData__DescriptionAssignment_6_2");
					put(grammarAccess.getMeasuredDataAccess().getIDAssignment_7_2(), "rule__MeasuredData__IDAssignment_7_2");
					put(grammarAccess.getMeasuredDataAccess().getConstraintsAssignment_8(), "rule__MeasuredData__ConstraintsAssignment_8");
					put(grammarAccess.getNonMeasuredDataAccess().getTypeAssignment_1(), "rule__NonMeasuredData__TypeAssignment_1");
					put(grammarAccess.getNonMeasuredDataAccess().getNameAssignment_2(), "rule__NonMeasuredData__NameAssignment_2");
					put(grammarAccess.getNonMeasuredDataAccess().getRepresentationAssignment_4(), "rule__NonMeasuredData__RepresentationAssignment_4");
					put(grammarAccess.getNonMeasuredDataAccess().getDescriptionAssignment_5_2(), "rule__NonMeasuredData__DescriptionAssignment_5_2");
					put(grammarAccess.getNonMeasuredDataAccess().getIDAssignment_6_2(), "rule__NonMeasuredData__IDAssignment_6_2");
					put(grammarAccess.getConstantDataAccess().getNameAssignment_1(), "rule__ConstantData__NameAssignment_1");
					put(grammarAccess.getConstantDataAccess().getRepresentationAssignment_3(), "rule__ConstantData__RepresentationAssignment_3");
					put(grammarAccess.getConstantDataAccess().getConstValueAssignment_4_1(), "rule__ConstantData__ConstValueAssignment_4_1");
					put(grammarAccess.getConstantDataAccess().getDescriptionAssignment_5_2(), "rule__ConstantData__DescriptionAssignment_5_2");
					put(grammarAccess.getConstantDataAccess().getIDAssignment_6_2(), "rule__ConstantData__IDAssignment_6_2");
					put(grammarAccess.getCalculatedAccess().getNameAssignment_1(), "rule__Calculated__NameAssignment_1");
					put(grammarAccess.getCalculatedAccess().getRepresentationAssignment_3(), "rule__Calculated__RepresentationAssignment_3");
					put(grammarAccess.getCalculatedAccess().getMethodNameAssignment_5(), "rule__Calculated__MethodNameAssignment_5");
					put(grammarAccess.getCalculatedAccess().getMethodNameOutAssignment_6_1(), "rule__Calculated__MethodNameOutAssignment_6_1");
					put(grammarAccess.getCalculatedAccess().getParameterAssignment_8(), "rule__Calculated__ParameterAssignment_8");
					put(grammarAccess.getCalculatedAccess().getParameterAssignment_9_1(), "rule__Calculated__ParameterAssignment_9_1");
					put(grammarAccess.getCalculatedAccess().getDescriptionAssignment_10_2(), "rule__Calculated__DescriptionAssignment_10_2");
					put(grammarAccess.getCalculatedAccess().getIDAssignment_11_2(), "rule__Calculated__IDAssignment_11_2");
					put(grammarAccess.getParameterAccess().getDatafieldAssignment_1(), "rule__Parameter__DatafieldAssignment_1");
					put(grammarAccess.getParameterAccess().getArgumentTypeAssignment_2_1(), "rule__Parameter__ArgumentTypeAssignment_2_1");
					put(grammarAccess.getDatastructureAccess().getNameAssignment_1(), "rule__Datastructure__NameAssignment_1");
					put(grammarAccess.getDatastructureAccess().getDatafieldsAssignment_3(), "rule__Datastructure__DatafieldsAssignment_3");
					put(grammarAccess.getDatastructureAccess().getDescriptionAssignment_4_2(), "rule__Datastructure__DescriptionAssignment_4_2");
					put(grammarAccess.getDatastructureAccess().getIDAssignment_5_2(), "rule__Datastructure__IDAssignment_5_2");
					put(grammarAccess.getDataRangeAccess().getLowerBoundAssignment_1(), "rule__DataRange__LowerBoundAssignment_1");
					put(grammarAccess.getDataRangeAccess().getUpperBoundAssignment_3(), "rule__DataRange__UpperBoundAssignment_3");
					put(grammarAccess.getDataRangeAccess().getDescriptionAssignment_4_2(), "rule__DataRange__DescriptionAssignment_4_2");
					put(grammarAccess.getDataRangeAccess().getIDAssignment_5_2(), "rule__DataRange__IDAssignment_5_2");
					put(grammarAccess.getDataAdaptionAccess().getScalingFactorAssignment_3(), "rule__DataAdaption__ScalingFactorAssignment_3");
					put(grammarAccess.getDataAdaptionAccess().getOffsetAssignment_7(), "rule__DataAdaption__OffsetAssignment_7");
					put(grammarAccess.getDataAdaptionAccess().getDescriptionAssignment_8_2(), "rule__DataAdaption__DescriptionAssignment_8_2");
					put(grammarAccess.getDataAdaptionAccess().getIDAssignment_9_2(), "rule__DataAdaption__IDAssignment_9_2");
					put(grammarAccess.getBoundAccess().getValueAssignment_0(), "rule__Bound__ValueAssignment_0");
					put(grammarAccess.getBoundAccess().getUnitAssignment_1(), "rule__Bound__UnitAssignment_1");
				}
			};
		}
		return nameMappings.get(element);
	}
	
	@Override
	protected Collection<FollowElement> getFollowElements(AbstractInternalContentAssistParser parser) {
		try {
			de.fzi.sensidl.language.ui.contentassist.antlr.internal.InternalSensidlParser typedParser = (de.fzi.sensidl.language.ui.contentassist.antlr.internal.InternalSensidlParser) parser;
			typedParser.entryRuleDataModel();
			return typedParser.getFollowElements();
		} catch(RecognitionException ex) {
			throw new RuntimeException(ex);
		}		
	}
	
	@Override
	protected String[] getInitialHiddenTokens() {
		return new String[] { "RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT" };
	}
	
	public SensidlGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(SensidlGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}
