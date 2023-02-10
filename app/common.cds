using riskmanagement as rm from '../db/schema';

//Annotate Risks elements
annotate rm.Risks with {
    ID      @title : 'Risk';
    title   @title : 'Title';
    owner   @title : 'Owner';
    prio    @title : 'Priority';
    impact  @title : 'Impact';
    descr   @title : 'Description';
    criticality @title : 'Criticality';
    miti    @title : 'Mitigations';
    miti @(Common:{
        //show text, not id for mitigation in the context of risks
        Text : miti.descr,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            Label : 'Mitigations',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterIn',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        }
    });
    bp @title : 'Business Partner';
    bp @(Common : {
        Text : bp.LastName,
        TextArrangement : #TextOnly,
        ValueList : {
            Label : 'Business Partners',
            CollectionPath : 'BusinessPartners',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bp_BusinessPartner,
                    ValueListProperty : 'BusinessPartner'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName'
                }
            ]
        }

    });
}

//Annotate Mitigation elements
annotate rm.Mitigations with {
    ID      @title : 'ID';
    descr   @title : 'Description';
}

//Annotate Business Partners elements
annotate rm.BusinessPartners with {
    BusinessPartner @(
        //UI.Hidden,
        Common : {Text : 'LastName'}
    );
    LastName @title : 'LastName';
    FirstName @title : 'FirstName';
}