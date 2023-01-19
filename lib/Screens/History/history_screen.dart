import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class History extends StatelessWidget {
  const History({super.key});
  launchURL() async {
    final url = Uri.parse('https://v2.imitpark.com/dcc-plus/');
    if (await launchUrl(url)) {
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: NavBar(),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    return Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu_sharp,
                    color: Colors.black,
                  ));
            },
          ),
          elevation: 0,
          backgroundColor: Colors.blue[100],
          title: const Text(
            "History",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
              color: Colors.black,
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SloganWidget(
                      title: "ചരിത്രം",
                      text:
                          "ആധുനിക കേരളത്തിന്റെ സൃഷ്ടാവ് മുൻ മുഖ്യമന്ത്രി,ശ്രീ കെ കരുണാകരന്റെ അനുഗ്രഹാശിസുകളോടെ മുൻ ഖാദി സഹകരണ വകുപ്പ് മന്ത്രി ശ്രീ സി എൻ ബാലകൃഷ്ണനാണ് നാല് നിലകളിലായുള്ള കെ കരുണാകരൻ സപ്തതി മന്ദിരം എന്ന പേരിൽ നാലു നിലകളിലായുള്ള തൃശ്ശൂർ ജില്ലാ കോൺഗ്രസിന്റെ ആസ്ഥാനമന്ദിരം പണി കഴിപ്പിച്ചത്. എന്നാൽ പത്തൊമ്പതാം നൂറ്റാണ്ടിന്റെ ആരംഭത്തിൽ തന്നെ ഇന്ത്യൻ നാഷണൽ കോൺഗ്രസ് സ്വാതന്ത്ര്യ സമര പോരാട്ടങ്ങൾക്ക് തൃശ്ശിവപേരൂരിൽ, അന്നത്തെ കൊച്ചി നാട്ടു രാജ്യത്തിൽ സജീവമായിരുന്നു."
                          "ഗുരുവായൂർ സത്യാഗ്രഹം, അയിത്തോച്ചാടനം, കുടി കെടപ്പ് സമരം, തുടങ്ങീ നീതി തേടിയുള്ള സാധാരണക്കാരന്റെ പോരാട്ടങ്ങൾക്ക് തൃശ്ശൂർ ഡി.സി.സി നേതൃത്വം നൽകി. സാംസ്കാരിക കേരളത്തിന്റെ തലസ്ഥാനമായി തൃശ്ശിവപേരൂർ മാറുന്നതിൽ മുഖ്യപങ്ക് തൃശൂരിലെ കോൺഗ്രസ് പ്രസ്ഥാനമാണ് വഹിച്ചിരുന്നത് നിരവധി ഖാദി- സഹകരണ പ്രസ്ഥാനങ്ങളുടെ രൂപീകരണത്തിലും അതു വഴി സ്വദേശി പ്രസ്ഥാനത്തെ ശക്തിപ്പെടുത്തുന്നതിലും തൃശ്ശൂർ ജില്ലാ കോൺഗ്രസ് പ്രസ്ഥാനം സ്തുത്യർഹമായ സേവന പ്രവർത്തനങ്ങൾ നടത്തിയെന്നത് , പിന്നീട് വന്ന ജനകീയ സർക്കാരുകളിൽ നേതാക്കൾക്ക് വലിയ പ്രാധാന്യം ലഭിക്കാൻ കാരണമായി. ശ്രീ.കെ.കരുണാകരന്റെ തട്ടകം എന്ന നിലയിലാണ് രാഷ്ട്രീയ കേരളത്തിൽ തൃശ്ശൂർ D. C.C ഭരണ സിര നിയന്ത്രണ കേന്ദ്രമായി മാറുന്നത്. നിരവധി കോൺഗ്രസ് നേതാക്കൾക്ക് അവരുടെ രാഷ്ട്രീയ സപര്യ സാർത്ഥകമാക്കുന്നതിന് തൃശ്ശൂർ ഡി.സി.സി. പിന്തുണ നൽകി."),
                ],
              ),
            ),
          ),
        ));
  }
}

class SloganWidget extends StatelessWidget {
  const SloganWidget(
      {super.key, required this.title, required this.text, this.text1});

  final String title;
  final String text;
  final String? text1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(elevation: 10, child: Image.asset("images/wha.jpg")),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    launchURL();
                  },
                  child: Text("Read More")),
            )
          ],
        ),
      ),
    );
  }
}
