#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Organization function which is not intended to be callen by anyone else but the XMSTicker (undefined variables errors will occure otherwhise)
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!hasInterface) exitWith {};
if(X39_MS2_var_ppEffect_EnableRadialBlur) then
{
	//X39_MS2_var_Internal_ppe_radialBlur [0.02, UNUSED, 0.3, 0.3]
	X39_MS2_var_Internal_ppe_radialBlur ppEffectAdjust [
							0.02 * _ppeRadialBlur,
							0,
							0.5 - 0.3 * _ppeFocus,
							0.5 - 0.3 * _ppeFocus
						];
	X39_MS2_var_Internal_ppe_radialBlur ppEffectCommit X39_MedSys_var_TickRate;
};
if(X39_MS2_var_ppEffect_EnableChromAberration) then
{
	X39_MS2_var_Internal_ppe_chromAberration ppEffectAdjust [
							0.03 * _ppeChromAberration,
							0.03 * _ppeChromAberration,
							true
						];
	X39_MS2_var_Internal_ppe_chromAberration ppEffectCommit X39_MedSys_var_TickRate; 
};
if(X39_MS2_var_ppEffect_EnableWetDistortion) then
{
	//X39_MS2_var_Internal_ppe_wetDistortion ppEffectAdjust [1, 0.1, 0.1, [1, 1, 1, 1], [0.3, 0.3, 0.05, 0.05], [0.05, 0.75, 0.1, 0.64]]; 
	X39_MS2_var_Internal_ppe_wetDistortion ppEffectAdjust [
							1,								//Black screen
							0.2, 0.2,						//Effect strenth
							1, 1, 1, 1,						//Wave Speed
							0.1, 0.1, 0.03, 0.03,			//1 - 2 Wave left/right factor, 3 - 4 crystalize (0.1 already is crystalized!)
							0.05, 0.55, 0.75, 0.75			//Fine tuning of upper 4 scalar values
						];
	X39_MS2_var_Internal_ppe_wetDistortion ppEffectCommit X39_MedSys_var_TickRate; 
};
if(X39_MS2_var_ppEffect_EnableColorCorrections) then
{
	//X39_MS2_var_Internal_ppe_wetDistortion ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.85, 0.75, 0.75, 0], [0.25, 1, 0, 1]]; 
	X39_MS2_var_Internal_ppe_colorCorrections ppEffectAdjust [
							1,								//BlackScreen circle
							1,								//BlackScreen full
							0,								//Brightness
							0, 0, 0, 0,						//Colorized overlay (R,G,B,A)
							1, 1, 1, 1.75 * _ppeGreyScreen,	//Color Corrections AKA STRANGE VUDU CRAP (R,G,B,A)
							0, 1, 0.1, 1					//Something with brightness again (IDK, IDK, IDK, A)
						];
	X39_MS2_var_Internal_ppe_colorCorrections ppEffectCommit X39_MedSys_var_TickRate; 
};
if(X39_MS2_var_ppEffect_EnableDynamicBlur) then
{
	//X39_MS2_var_Internal_ppe_wetDistortion ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.85, 0.75, 0.75, 0], [0.25, 1, 0, 1]]; 
	X39_MS2_var_Internal_ppe_dynamicBlur ppEffectAdjust [_ppeDynamicBlur];
	X39_MS2_var_Internal_ppe_dynamicBlur ppEffectCommit X39_MedSys_var_TickRate; 
};
if(X39_MS2_var_ppEffect_EnableFilmGrain) then
{
	//X39_MS2_var_Internal_ppe_wetDistortion ppEffectAdjust [0, 1, 1, 0.1, 0.1, false]
	X39_MS2_var_Internal_ppe_filmGrain ppEffectAdjust [
							_ppeFilmGrain,					//Alpha
							1,								//Ammount
							1,								//Ammount2
							0.1, 0.1,						//Intensity X/Y
							false							//Useless parameter
						];
	X39_MS2_var_Internal_ppe_filmGrain ppEffectCommit X39_MedSys_var_TickRate; 
};
if(X39_MS2_var_ppEffect_EnableColorInversion) then
{
	//X39_MS2_var_Internal_ppe_colorInversion ppEffectAdjust [0, 0, 0];
	X39_MS2_var_Internal_ppe_colorInversion ppEffectAdjust [_ppeColorInversion, _ppeColorInversion, _ppeColorInversion]; //Inversion R,G,B
	X39_MS2_var_Internal_ppe_colorInversion ppEffectCommit X39_MedSys_var_TickRate;  
};