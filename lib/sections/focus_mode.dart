import 'package:fluent_ui/fluent_ui.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FocusMode extends StatefulWidget {
  const FocusMode({super.key});

  @override
  State<FocusMode> createState() => _FocusModeState();
}

class _FocusModeState extends State<FocusMode> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 30),
              const Meter(),
              const SizedBox(height: 40),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: FluentTheme.of(context).micaBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1)
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: FluentTheme.of(context).micaBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1)
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 325,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: FluentTheme.of(context).micaBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1)
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 325,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: FluentTheme.of(context).micaBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1)
                      ),
                      child:const SessionHistory(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      );
  }
}

class Meter extends StatefulWidget {
  const Meter({
    super.key,
  });

  @override
  State<Meter> createState() => _MeterState();
}

class _MeterState extends State<Meter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 25.0,
          animation: true,
          backgroundColor: FluentTheme.of(context).micaBackgroundColor,
          
          percent: 1,
          center:const Text(
            "25:00",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor:const Color(0xffFF5C50),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers buttons in row
          children: [
            // 🔄 Reload Button (Smaller)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Button(
                onPressed: () => debugPrint('Reload Pressed'),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  backgroundColor: WidgetStateProperty.all(FluentTheme.of(context).micaBackgroundColor),
                ),
                child: const Icon(FluentIcons.sync, size: 26,opticalSize: 16,),
              ),
            ),
    
            const SizedBox(width: 50), // Space between buttons
    
            // ▶ Play Button (Bigger)
            SizedBox(
              width: 70,
              height: 70,
              child: Button(
                onPressed: () => debugPrint('Play Pressed'),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  backgroundColor: WidgetStateProperty.all(const Color(0xffFF5C50)),
                ),
                child: Container(
                  padding:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: const Icon(FluentIcons.play_solid, size: 24,color: Color(0xffFF5C50),)
                ),
              ),
            ),
    
            const SizedBox(width: 50), // Space between buttons
    
            // ⏹ Stop Button (Smaller)
            // SizedBox(
            //   width: 50,
            //   height: 50,
            //   child: Button(
            //     onPressed: () => debugPrint('Stop Pressed'),
            //     style: ButtonStyle(
            //       shape: WidgetStateProperty.all(const CircleBorder()),
            //       backgroundColor: WidgetStateProperty.all(FluentTheme.of(context).micaBackgroundColor),
            //     ),
            //     child: Container(
            //       padding:const EdgeInsets.all(6),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(100)
            //       ),
            //       child: Icon(FluentIcons.stop_solid, size: 15,color: FluentTheme.of(context).micaBackgroundColor)
            //     ),
            //   ),
            // ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: FluentTheme.of(context).inactiveBackgroundColor,width: 1),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Button(
                onPressed: () => showSettingsDialog(context),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  backgroundColor: WidgetStateProperty.all(FluentTheme.of(context).micaBackgroundColor),
                ),
                child: const Icon(FluentIcons.settings, size: 26,opticalSize: 16,),
              ),
            ),
          ],
        )
      ],
    );
  }

  void showSettingsDialog(BuildContext context) async {
    double workDuration = 25;
    double shortBreak = 5;
    double longBreak = 15;
    bool autoStart = false;
    bool blockDistractions = false;
    bool enableSounds = true;
    String selectedMode = "Custom";

    final result = await showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return ContentDialog(
            title: const Text('Focus Mode Settings'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Focus Mode Selection
                ComboBox<String>(
                  value: selectedMode,
                  items: ["Custom", "Deep Work (60 min)", "Quick Tasks (25 min)", "Reading (45 min)"].map((mode) {
                    return ComboBoxItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() {
                        selectedMode = value;
                        if (value == "Deep Work (60 min)") {
                          workDuration = 60;
                          shortBreak = 10;
                        } else if (value == "Quick Tasks (25 min)") {
                          workDuration = 25;
                          shortBreak = 5;
                        } else if (value == "Reading (45 min)") {
                          workDuration = 45;
                          shortBreak = 10;
                        }
                      });
                    }
                  },
                ),
                const SizedBox(height: 15,),
                // Work Duration Slider
                Text("Work Duration: ${workDuration.toInt()} min"),
                const SizedBox(height: 10,),
                Slider(
                  value: workDuration,
                  min: 15,
                  max: 120,
                  divisions: 21,
                  onChanged: (value) => setDialogState(() => workDuration = value),
                ),
                const SizedBox(height: 15,),
                // Short Break Duration Slider
                Text("Short Break: ${shortBreak.toInt()} min"),
                const SizedBox(height: 10,),
                Slider(
                  value: shortBreak,
                  min: 1,
                  max: 15,
                  divisions: 14,
                  onChanged: (value) => setDialogState(() => shortBreak = value),
                ),
                const SizedBox(height: 15,),
                // Long Break Duration Slider
                Text("Long Break: ${longBreak.toInt()} min"),
                const SizedBox(height: 10,),
                Slider(
                  value: longBreak,
                  min: 5,
                  max: 60,
                  divisions: 11,
                  onChanged: (value) => setDialogState(() => longBreak = value),
                ),
                const SizedBox(height: 20,),
                // Toggle Options
                Checkbox(
                  checked: autoStart,
                  onChanged: (value) => setDialogState(() => autoStart = value!),
                  content: const Text("Auto-start next session"),
                ),
                const SizedBox(height: 10,),
                Checkbox(
                  checked: blockDistractions,
                  onChanged: (value) => setDialogState(() => blockDistractions = value!),
                  content: const Text("Block distractions during focus mode"),
                ),
                const SizedBox(height: 10,),
                Checkbox(
                  checked: enableSounds,
                  onChanged: (value) => setDialogState(() => enableSounds = value!),
                  content: const Text("Enable sounds & notifications"),
                ),
              ],
            ),
            actions: [
              Button(
                child: const Text('Reset All'),
                onPressed: () {
                  setDialogState(() {
                    workDuration = 25;
                    shortBreak = 5;
                    longBreak = 15;
                    autoStart = false;
                    blockDistractions = false;
                    enableSounds = true;
                    selectedMode = "Custom";
                  });
                },
              ),
              FilledButton(
                child: const Text('Save'),
                onPressed: () => Navigator.pop(context, 'Saved'),
              ),
            ],
          );
        },
      ),
    );
  }

}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Focus Mode",style: FluentTheme.of(context).typography.subtitle,),
        // Button(
        //   style: ButtonStyle(padding: WidgetStateProperty.all(const EdgeInsets.only(top: 8,bottom: 8,left: 25,right: 25))),
        //   child: const Text('Settings',style: TextStyle(fontWeight: FontWeight.w600),),
        //   onPressed: () => debugPrint('pressed button'),
        // )
      ],
    );
  }
}

class SessionHistory extends StatelessWidget {
  const SessionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const BoxConstraints(
        minHeight: 200,
        maxHeight: 400
      ),
      
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: FluentTheme.of(context).micaBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Session History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 200, child: Text("Date", style: TextStyle(fontWeight: FontWeight.w700))),
                SizedBox(width: 100, child: Text("Duration", style: TextStyle(fontWeight: FontWeight.w700))),
              ],
            ),
          ),
          Container(height: 1, color: FluentTheme.of(context).inactiveBackgroundColor),
          const SizedBox(height: 10),
          // Wrap List of Sessions in Expanded and SingleChildScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  8,
                  (index) => const Session(
                    date: "2023-10-01 - 23:44",
                    duration: "25 min",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Session extends StatelessWidget {
  final String date;
  final String duration;
  const Session({
    super.key,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 200,height: 20,child: Text(date,style:const TextStyle(fontWeight: FontWeight.w500),)),
              SizedBox(width: 100,height: 20,child: Text(duration,style:const TextStyle(fontWeight: FontWeight.w500),)),
            ],
          ),
        ),
        Container(height: 1, color: FluentTheme.of(context).inactiveBackgroundColor),
      ],
    );
  }
}