select
concat_ws('-', ${vh_deployment_id}, patient_id) as vho_patient_id,             
patient_id as patient_id,                 
concat_ws('-', ${vh_deployment_id}, encounter_id) as vho_encounter_id,           
encounter_id as encounter_id,               
dos as dos,                        
concat_ws('-', ${vh_deployment_id}, ocular_refraction_id, vh_projection_set_id)as vho_ocular_visual_acuity_id,
ocular_visual_acuity_id as ocular_visual_acuity_id,    
laterality as laterality,                 
${vh_deployment_id} as vh_deployment_id,           
${vh_ehr_id} as vh_ehr_id,                  
${vh_etl_id} as vh_etl_id,                  
${vh_practice_id} as vh_practice_id,             
${vh_pull_id} as vh_pull_id,                 
${vh_location_id} as vh_location_id,             
type_code as type_code,                  
va as va,                         
modifier as modifier,                   
${vh_registry_id} as vh_registry_id,             
description as description,                
etrs as etrs,                       
logmar as logmar,                     
method as method,                    
near as near,                    
pinhole as pinhole ,                   
reason as reason   ,                  
concat_ws('-', ${vh_deployment_id}, ocular_refraction_id) as vho_ocular_refraction_id,   
concat_ws('-', ${vh_deployment_id}, provider_id) as vho_provider_id,  
ocular_refraction_id as ocular_refraction_id, 
provider_id as provider_id,
source_field as source_field,
source_table as source_table,
dos_src as dos_src,
vh_projection_set_id as vh_projection_set_id,
correction as correction                 
from
    (
    select             
    t.PtID as patient_id,                    
    t.VisitID as encounter_id,               
    t.DOSDate as dos,                        
    t.VisitTechID as ocular_visual_acuity_id,    
    'OD' as laterality,  --CHANGE                               
    'CC' as type_code,   --CHANGE                
    t.WUVA_CC_OD as va,  --CHANGE                        
    '' as modifier,                         
    ''  as description,                
    '' as etrs,                       
    '' as logmar,                     
    'Distance' as method,  --CHANGE                   
    '' as near,                    
    'N' as pinhole ,  --CHANGE                  
    '' as reason   ,                  
    '' as ocular_refraction_id, 
    v.ProviderEMPID as provider_id,
    'WUVA_CC_OD' as source_field, --CHANGE 
    'EMR_Visit_Tech' as source_table,
    t.DOSDate as dos_src,
    'bv999m4idtlcqtshqo2g' as vh_projection_set_id, --CHANGE 
    'Y' as correction --CHANGE 
    from emr_visit_tech as t
    left join emr_visits v on t.VisitID = v.VisitID
    where v.ExcludeVisit <> -1
    
union all

    select             
    t.PtID as patient_id,                    
    t.VisitID as encounter_id,               
    t.DOSDate as dos,                        
    t.VisitTechID as ocular_visual_acuity_id,    
    'OS' as laterality,    --CHANGE                           
    'CC' as type_code,     --CHANGE              
    t.WUVA_CC_OS as va,    --CHANGE                      
    '' as modifier,                         
    ''  as description,                
    '' as etrs,                       
    '' as logmar,                     
    'Distance' as method,  --CHANGE                   
    '' as near,                    
    'N' as pinhole ,       --CHANGE             
    '' as reason   ,                  
    '' as ocular_refraction_id, 
    v.ProviderEMPID as provider_id,
    'WUVA_CC_OS' as source_field,      --CHANGE 
    'EMR_Visit_Tech' as source_table,  --CHANGE 
    t.DOSDate as dos_src,
    'c54p1nodpdsci4h0v04g' as vh_projection_set_id,    --CHANGE 
    'Y' as correction   --CHANGE 
    from emr_visit_tech as t
    left join emr_visits v on t.VisitID = v.VisitID
    where v.ExcludeVisit <> -1
    
union all 
    
    select             
    t.PtID as patient_id,                    
    t.VisitID as encounter_id,               
    t.DOSDate as dos,                        
    t.VisitTechID as ocular_visual_acuity_id,    
    'OU' as laterality,    --CHANGE                           
    'CC' as type_code,     --CHANGE              
    t.WUVA_CC_OU as va,    --CHANGE                      
    '' as modifier,                         
    ''  as description,                
    '' as etrs,                       
    '' as logmar,                     
    'Distance' as method,  --CHANGE                   
    '' as near,                    
    'N' as pinhole ,       --CHANGE             
    '' as reason   ,                  
    '' as ocular_refraction_id, 
    v.ProviderEMPID as provider_id,
    'WUVA_CC_OU' as source_field,      --CHANGE 
    'EMR_Visit_Tech' as source_table,  --CHANGE 
    t.DOSDate as dos_src,
    'c54p1s0dpdsci4h0v060' as vh_projection_set_id,    --CHANGE 
    'Y' as correction   --CHANGE 
    from emr_visit_tech as t
    left join emr_visits v on t.VisitID = v.VisitID
    where v.ExcludeVisit <> -1
    )
