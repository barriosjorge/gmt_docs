
.. risk_register:


Risk Register
-------------

The Software and Controls risks currently maintained in the risk register are
summarized in the following tables. The tables below show :ref:`medium exposure
risks <medium_risks>` for the SWC Design and Development Phase, and :ref:`low
exposure risks <low_risks>`.  Note that the SWCS does not have high exposure
risks.


.. _medium_risks:

.. table:: Medium Exposure SWC Risks

  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+
  |   Risk          |   Description                |   Risk       |   Impact       |   Likelihood     |   Risk      |   Mitigations                                        |
  |                 |                              |   Type       |                |                  |   Exposure  |                                                      |
  +=================+==============================+==============+================+==================+=============+======================================================+
  |   RISK0054:     |   A malfunction in the       |   Technical  |   5 -          |   2 - Unlikely   |     10      |   MIT0122: Integration with a dummy mirror           |
  |   M1 Support    |   control system of M1       |              |   Significant  |                  |             |   MIT0123: Implement safety system independently     |
  |   control       |   could eventually break     |              |                |                  |             |   of the main controller                             |
  |   system        |   the primary mirror.        |              |                |                  |             |   MIT0124: Safety system shall implement independent |
  |                 |                              |              |                |                  |             |   parallel and different safety strategies           |
  |                 |                              |              |                |                  |             |   MIT0125: Peer review of critical code parts        |
  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+
  |   RISK0044:     |   Developing software        |   Technical  |   2 - Minor    |   4 - Probable   |     8       |   MIT0093: Prioritize user scenarios                 |
  |   Incorrect     |   without appropriate        |              |                |                  |             |   MIT0094: Ensure that user scenarios provide real   |
  |   Priorities    |   priorities could consume   |              |                |                  |             |   end value                                          |
  |                 |   resources that don’t add   |              |                |                  |             |   MIT0095: Ensure that critical scenarios are        |
  |                 |   value to the system,       |              |                |                  |             |   implemented first                                  |
  |                 |   eventually exceeding the   |              |                |                  |             |   MIT0096: De-scope low priority scenarios           |
  |                 |   contingency budget.        |              |                |                  |             |                                                      |
  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+
  |   RISK0043:     |   Developing the wrong       |   Schedule   |   2 - Minor    |   4 - Probable   |     8       |   MIT0088: Early user involvement                    |
  |   Incorrect     |   functionality could be a   |              |                |                  |             |   MIT0089: Prototyping and early integration         |
  |   requirements  |   waste of resources.        |              |                |                  |             |   MIT0090: Simulation                                |
  |                 |                              |              |                |                  |             |   MIT0091: Analysis of requirements                  |
  |                 |                              |              |                |                  |             |   MIT0092: Configuration control                     |
  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+
  |   RISK0042:     |   Large or complex           |   Technical  |   2 - Minor    |   4 - Probable   |     8       |   MIT0086: Few interfaces                            |
  |   Interface     |   interfaces could require a |              |                |                  |             |   MIT0087: Narrow interfaces                         |
  |   complexity    |   significant effort to      |              |                |                  |             |                                                      |
  |                 |   define and manage them.    |              |                |                  |             |                                                      |
  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+
  |   RISK0036:     |   Continuous stream of       |   Schedule   |   2 - Minor    |   4 - Probable   |     8       |   MIT0065: Early user involvement                    |
  |   Requirements  |   requirement changes        |              |                |                  |             |   MIT0066: Change control management                 |
  |   stability     |   could delay the            |              |                |                  |             |   MIT0067: Agile development                         |
  |                 |   development of some        |              |                |                  |             |                                                      |
  |                 |   subsystems.                |              |                |                  |             |                                                      |
  +-----------------+------------------------------+--------------+----------------+------------------+-------------+------------------------------------------------------+


.. _low_risks:

.. table:: Low Exposure SWC Risks

  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   Risk             |   Description                   |   Risk      |   Impact     |    Likelihood    |   Risk     |   Mitigations                                         |
  |                    |                                 |   Type      |              |                  |   Exposure |                                                       |
  +====================+=================================+=============+==============+==================+============+=======================================================+
  |   RISK0079:        |   Propagation of requirement    |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0167: Change control management                  |
  |   Requirements     |   changes when external         |             |              |                  |            |                                                       |
  |   change           |   developers are involved       |             |              |                  |            |                                                       |
  |   propagation      |   may result in increased       |             |              |                  |            |                                                       |
  |                    |   costs.                        |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0078:        |   Shortfalls in externally      |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0164: Establish adequate acceptance              |
  |   External quality |   procured software and         |             |              |                  |            |   procedures                                          |
  |   control          |   hardware may result in        |             |              |                  |            |   MIT0165: Request early delivery of software         |
  |                    |   additional rework.            |             |              |                  |            |   components to assess performance of                 |
  |                    |                                 |             |              |                  |            |   the external organization                           |
  |                    |                                 |             |              |                  |            |   MIT0166: Ensure external organization has           |
  |                    |                                 |             |              |                  |            |   adequate CMMI or equivalent level                   |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0056:        |   Poor architectural design     |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0128: Early delivery of complete end-to-end      |
  |   Complexity       |   may produce a system too      |             |              |                  |            |   functionality will assess the adequacy              |
  |                    |   complex to operate and        |             |              |                  |            |   of the architecture                                 |
  |                    |   understand                    |             |              |                  |            |   MIT0129: Allow enough slack in the schedule         |
  |                    |                                 |             |              |                  |            |   to refactor components when architecture            |
  |                    |                                 |             |              |                  |            |   starts to show excessive complexity                 |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0053:        |   Unrealistic schedule, cost    |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0119: Deployment of an Agile process will        |
  |   Unrealistic      |   estimation or staffing plans. |             |              |                  |            |   help to identify those issues early                 |
  |   plan             |                                 |             |              |                  |            |   in the project                                      |
  |                    |                                 |             |              |                  |            |   MIT0120: Periodic reviews and retrospectives        |
  |                    |                                 |             |              |                  |            |   MIT0121: Systematic use of performance metrics      |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0052:        |   Key members that leave the    |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0115: Competitive employment conditions          |
  |   Stability        |   project can affect the        |             |              |                  |            |   MIT0116: Allow for some level of redundancy         |
  |   of staff         |   productivity of the           |             |              |                  |            |   between members of the development                  |
  |                    |   development team.             |             |              |                  |            |   team                                                |
  |                    |                                 |             |              |                  |            |   MIT0117: Avoid code ownership                       |
  |                    |                                 |             |              |                  |            |   MIT0118: Maintain high team motivation              |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0051:        |   Lack of operations staff      |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0114: Involve operations staff early on in the   |
  |   Operations staff |   involvement in the design     |             |              |                  |            |   project                                             |
  |   overlap          |   could result in knowledge     |             |              |                  |            |                                                       |
  |                    |   gap between project and       |             |              |                  |            |                                                       |
  |                    |   operations with the           |             |              |                  |            |                                                       |
  |                    |   consequent impact on          |             |              |                  |            |                                                       |
  |                    |   efficiency.                   |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0050:        |   A system that is difficult to |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0112: Involve operation staff early on           |
  |   Maintainability  |   maintain could result in      |             |              |                  |            |   MIT0113: Implement diagnostic tools throughout      |
  |                    |   efficiency losses during      |             |              |                  |            |                                                       |
  |                    |   design and operation phases.  |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0047:        |   Late delivery of software to  |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0102: Agile process to develop a predictable     |
  |   External         |   external developers may       |             |              |                  |            |   development process                                 |
  |   deadlines        |   result in delays in their     |             |              |                  |            |   MIT0103: Realistic milestones                       |
  |                    |   schedule.                     |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0046:        |   Lack of adequate support to   |   Schedule  |   2 - Minor  |    3 - Possible  |   6        |   MIT0100: Adequate sizing of the support effort      |
  |   Support to       |   external groups developing    |             |              |                  |            |   MIT0101: Strong software community support          |
  |   external groups  |   software for GMT may result   |             |              |                  |            |                                                       |
  |                    |   in poor implementation and    |             |              |                  |            |                                                       |
  |                    |   delays.                       |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0045:        |   The ultra-low latency bus is  |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0097: Early prototyping.                         |
  |   Ultra-low        |   critical to the performance   |             |              |                  |            |   MIT0098: Performance analysis                       |
  |   latency bus      |   of a modular AO/AcO system.   |             |              |                  |            |   MIT0099: Agile delivery of critical scenarios       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0041:        |   Poor documentation could      |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0083: Consider documentation as an integral      |
  |   Poor             |   impact the efficiency of      |             |              |                  |            |   part of the product                                 |
  |   documentation    |   operation and maintenance     |             |              |                  |            |   MIT0084: Integrate documentation in the             |
  |                    |   tasks.                        |             |              |                  |            |   semantic model so always stays current              |
  |                    |                                 |             |              |                  |            |   MIT0085: Ensure quality of documentation            |
  |                    |                                 |             |              |                  |            |   produced by external providers                      |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0039:        |   Single vendor lock-in could   |   Technical |   2 - Minor  |    3 - Possible  |   6        |   MIT0076: Use of open standards                      |
  |   Vendor lock-in   |   expose the project to lack of |             |              |                  |            |   MIT0077: Encapsulate product dependencies           |
  |                    |   support of some components    |             |              |                  |            |                                                       |
  |                    |   if vendor goes out of         |             |              |                  |            |                                                       |
  |                    |   business.                     |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0055:        |   A malfunction of the mount    |   Technical |   2 - Minor  |    2 - Unlikely  |   4        |   MIT0126: Modeling                                   |
  |   Mount Control    |   servo system could result in  |             |              |                  |            |   MIT0127: System shall allow to tune easily any      |
  |   System           |   a system that doesn't meet    |             |              |                  |            |   parameter that can affect the performance           |
  |                    |   specs.                        |             |              |                  |            |   of the servo loop                                   |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0049:        |   Inadequate architectural      |   Technical |   2 - Minor  |    2 - Unlikely  |   4        |   MIT0109: Early prototyping                          |
  |   Scalability      |   design may result in a        |             |              |                  |            |   MIT0110: Stress testing                             |
  |                    |   system that doesn't scale     |             |              |                  |            |   MIT0111: Redesign components causing                |
  |                    |   properly in the production    |             |              |                  |            |   scalability bottleneck                              |
  |                    |   phase.                        |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0048:        |   Technology adopted could      |   Technical |   1 - Low    |    3 - Possible  |   3        |   MIT0104: Delay acquisition when component           |
  |   Technology       |   become obsolete or vendor     |             |              |                  |            |   planned integration allows it.                      |
  |   obsolescence     |   can go out of business due    |             |              |                  |            |   MIT0105: Use COTS products based on open            |
  |                    |   to the long life spam of      |             |              |                  |            |   standards                                           |
  |                    |   the project phase making      |             |              |                  |            |   MIT0106: Consider the use of open source            |
  |                    |   difficult to ensure support   |             |              |                  |            |   components with excellent track of                  |
  |                    |   and maintainability.          |             |              |                  |            |   community support                                   |
  |                    |                                 |             |              |                  |            |   MIT0107: Plan for enough spares to guarantee        |
  |                    |                                 |             |              |                  |            |   operation life                                      |
  |                    |                                 |             |              |                  |            |   MIT0108: Avoid single vendor lock-in                |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0040:        |   Technology with poor          |   Technical |   1 - Low    |    3 - Possible  |   3        |   MIT0078: Prototype early                            |
  |   Inadequate       |   reliability or that doesn't   |             |              |                  |            |   MIT0079: Adopt different technology if prototype    |
  |   technology       |   perform as expected could     |             |              |                  |            |   shows that the chosen one is not adequate           |
  |                    |   make difficult to meet the    |             |              |                  |            |   MIT0080: Use fault tolerance techniques on          |
  |                    |   performance requirements.     |             |              |                  |            |   critical systems                                    |
  |                    |                                 |             |              |                  |            |   MIT0081: Check experience of other users            |
  |                    |                                 |             |              |                  |            |   MIT0082: Use conservative specs                     |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0038:        |   An inappropriate              |   Schedule  |   1 - Low    |    3 - Possible  |   3        |   MIT0072: Strong GMT software community support      |
  |   External         |   management of software        |             |              |                  |            |   MIT0073: Well defined software standards            |
  |   software         |   developed externally could    |             |              |                  |            |   MIT0074: Well defined interfaces                    |
  |   overhead         |   take excessive resources      |             |              |                  |            |   MIT0075: Adequate estimation of the support         |
  |                    |   from the core development     |             |              |                  |            |   needed                                              |
  |                    |   team.                         |             |              |                  |            |                                                       |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
  |   RISK0037:        |   An insufficient or            |   Technical |   1 - Low    |    3 - Possible  |   3        |   MIT0068: Iterative development allows to assess     |
  |   Process          |   inadequate development        |             |              |                  |            |   the adequacy of the process and                     |
  |   adequacy         |   process could delay the       |             |              |                  |            |   identify areas to improve                           |
  |                    |   completion of the system.     |             |              |                  |            |   MIT0069: Agile development                          |
  |                    |                                 |             |              |                  |            |   MIT0070: Periodic reviews and retrospectives        |
  |                    |                                 |             |              |                  |            |   MIT0071: Develop systematic metrics to assess       |
  |                    |                                 |             |              |                  |            |   the development effort                              |
  +--------------------+---------------------------------+-------------+--------------+------------------+------------+-------------------------------------------------------+
