/**
 * Created by LEIDY on 18/10/2015.
 */

function getRadioButtonSelectedValue(ctrl)
{
    for(i=0;i<ctrl.length;i++)
        if(ctrl[i].checked) return ctrl[i].value;
}