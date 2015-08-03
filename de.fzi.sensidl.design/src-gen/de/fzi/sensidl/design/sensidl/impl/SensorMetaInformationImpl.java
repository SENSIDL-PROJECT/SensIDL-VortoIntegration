/**
 */
package de.fzi.sensidl.design.sensidl.impl;

import de.fzi.sensidl.design.sensidl.Alignment;
import de.fzi.sensidl.design.sensidl.Coding;
import de.fzi.sensidl.design.sensidl.Endianness;
import de.fzi.sensidl.design.sensidl.SensorMetaInformation;
import de.fzi.sensidl.design.sensidl.sensidlPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Sensor Meta Information</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link de.fzi.sensidl.design.sensidl.impl.SensorMetaInformationImpl#getCoding <em>Coding</em>}</li>
 *   <li>{@link de.fzi.sensidl.design.sensidl.impl.SensorMetaInformationImpl#getEndianness <em>Endianness</em>}</li>
 *   <li>{@link de.fzi.sensidl.design.sensidl.impl.SensorMetaInformationImpl#getAlignment <em>Alignment</em>}</li>
 * </ul>
 *
 * @generated
 */
public class SensorMetaInformationImpl extends MinimalEObjectImpl.Container implements SensorMetaInformation {
	/**
	 * The default value of the '{@link #getCoding() <em>Coding</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getCoding()
	 * @generated
	 * @ordered
	 */
	protected static final Coding CODING_EDEFAULT = Coding.SENSIDL_BINARY;

	/**
	 * The cached value of the '{@link #getCoding() <em>Coding</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getCoding()
	 * @generated
	 * @ordered
	 */
	protected Coding coding = CODING_EDEFAULT;

	/**
	 * The default value of the '{@link #getEndianness() <em>Endianness</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getEndianness()
	 * @generated
	 * @ordered
	 */
	protected static final Endianness ENDIANNESS_EDEFAULT = Endianness.BIG_ENDIAN;

	/**
	 * The cached value of the '{@link #getEndianness() <em>Endianness</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getEndianness()
	 * @generated
	 * @ordered
	 */
	protected Endianness endianness = ENDIANNESS_EDEFAULT;

	/**
	 * The default value of the '{@link #getAlignment() <em>Alignment</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getAlignment()
	 * @generated
	 * @ordered
	 */
	protected static final Alignment ALIGNMENT_EDEFAULT = Alignment._8BIT;

	/**
	 * The cached value of the '{@link #getAlignment() <em>Alignment</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getAlignment()
	 * @generated
	 * @ordered
	 */
	protected Alignment alignment = ALIGNMENT_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected SensorMetaInformationImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return sensidlPackage.Literals.SENSOR_META_INFORMATION;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Coding getCoding() {
		return coding;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setCoding(Coding newCoding) {
		Coding oldCoding = coding;
		coding = newCoding == null ? CODING_EDEFAULT : newCoding;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, sensidlPackage.SENSOR_META_INFORMATION__CODING, oldCoding, coding));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Endianness getEndianness() {
		return endianness;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setEndianness(Endianness newEndianness) {
		Endianness oldEndianness = endianness;
		endianness = newEndianness == null ? ENDIANNESS_EDEFAULT : newEndianness;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, sensidlPackage.SENSOR_META_INFORMATION__ENDIANNESS, oldEndianness, endianness));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Alignment getAlignment() {
		return alignment;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setAlignment(Alignment newAlignment) {
		Alignment oldAlignment = alignment;
		alignment = newAlignment == null ? ALIGNMENT_EDEFAULT : newAlignment;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, sensidlPackage.SENSOR_META_INFORMATION__ALIGNMENT, oldAlignment, alignment));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case sensidlPackage.SENSOR_META_INFORMATION__CODING:
				return getCoding();
			case sensidlPackage.SENSOR_META_INFORMATION__ENDIANNESS:
				return getEndianness();
			case sensidlPackage.SENSOR_META_INFORMATION__ALIGNMENT:
				return getAlignment();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case sensidlPackage.SENSOR_META_INFORMATION__CODING:
				setCoding((Coding)newValue);
				return;
			case sensidlPackage.SENSOR_META_INFORMATION__ENDIANNESS:
				setEndianness((Endianness)newValue);
				return;
			case sensidlPackage.SENSOR_META_INFORMATION__ALIGNMENT:
				setAlignment((Alignment)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case sensidlPackage.SENSOR_META_INFORMATION__CODING:
				setCoding(CODING_EDEFAULT);
				return;
			case sensidlPackage.SENSOR_META_INFORMATION__ENDIANNESS:
				setEndianness(ENDIANNESS_EDEFAULT);
				return;
			case sensidlPackage.SENSOR_META_INFORMATION__ALIGNMENT:
				setAlignment(ALIGNMENT_EDEFAULT);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case sensidlPackage.SENSOR_META_INFORMATION__CODING:
				return coding != CODING_EDEFAULT;
			case sensidlPackage.SENSOR_META_INFORMATION__ENDIANNESS:
				return endianness != ENDIANNESS_EDEFAULT;
			case sensidlPackage.SENSOR_META_INFORMATION__ALIGNMENT:
				return alignment != ALIGNMENT_EDEFAULT;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (coding: ");
		result.append(coding);
		result.append(", endianness: ");
		result.append(endianness);
		result.append(", alignment: ");
		result.append(alignment);
		result.append(')');
		return result.toString();
	}

} //SensorMetaInformationImpl
