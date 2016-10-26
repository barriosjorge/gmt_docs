fs = require 'fs'

DCS 'isample_dcs',
    info: 'Hardware Developer Kit Control System'
    desc: fs.readFileSync __dirname + '/isample_dcs.rst', 'utf8'

    connectors: [
        { id: 8101, from: { element: "isample_ctrl_super", port: "heartbeat_out"}, to: { element: "isample_dcs_super", port: "heartbeat_in"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_vis_super",  port: "heartbeat_out"}, to: { element: "isample_dcs_super", port: "heartbeat_in"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_cal_super",  port: "heartbeat_out"}, to: { element: "isample_dcs_super", port: "heartbeat_in"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_seq_super",  port: "heartbeat_out"}, to: { element: "isample_dcs_super", port: "heartbeat_in"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8101, from: { element: "isample_diag_super", port: "heartbeat_out"}, to: { element: "isample_dcs_super", port: "heartbeat_in"},  max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
    ]


Package 'isample_vis_pkg',
    info: 'isample Visualization Package'
    desc: 'isample Visualization Package'

Package 'isample_seq_pkg',
    info: 'isample Sequencing Package'
    desc: 'isample Sequencing Package'

Package 'isample_diag_pkg',
    info: 'isample Diagnosis Package'
    desc: 'isample Diagnosis Package'

Package 'isample_cal_pkg',
    info: 'isample Calibration Package'
    desc: 'isample Calibration Package'

Package 'isample_wkf_pkg',
    info: 'isample Workflow Package'
    desc: 'isample Workflow Package'

Package 'isample_mngt_pkg',
    info: 'isample Management Package'
    desc: 'isample Management Package'
