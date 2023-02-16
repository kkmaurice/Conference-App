import 'package:shared_preferences/shared_preferences.dart';

import '../models/speakers.dart';

List<String> events = [
  'assets/images/event1.jpg',
  'assets/images/event2.jpg', 
  'assets/images/event3.jpg', 
  'assets/images/event4.jpg',
  'assets/images/event5.jpg',
  'assets/images/event6.jpg',
  'assets/images/event7.jpg',
];

SharedPreferences? sharedPreferences;

List<Speakers> speakers = [
  Speakers(
    id: '1',
    name: 'Ronnie Mayanja', 
    image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2023/01/ronnie-m-270x216.jpg', 
    title: 'Founder Ugandan Diaspora Network , Uganda Canadian Business Expo & Convention', 
    twitter: 'https://twitter.com/intent/tweet?text=Ronnie%20Mayanja%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fronnie-mayanja%2F&related=AddToAny,micropat', 
    facebook: 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fronnie-mayanja%2F&t=Ronnie%20Mayanja&quote=',
    description: "Ronnie Mayanja is the founder of Ugandan Diaspora Network, a social networking forum celebrating Uganda’s success stories abroad. Now in its 12th year the forum holds an annual Diaspora Social Networking Gala and Business Breakfast at Kampala Serena Hotel and is proud to call Dr. Maggie Kigozi Patron. Ronnie previously served as a member of the Uganda North American Association (UNAA) Board of Directors for two terms before moving into Diaspora-related consultancy work. Ronnie is also the founder of the Uganda Canadian Business Expo & Convention, a business networking forum that brings together Ugandan and Canadian business leaders to explore business opportunities. Recently Ronnie Mayanja registered Uganda Diaspora Network Inc. as a non-profit in the State of Massachusetts to help promote his philanthropic work among the New England Diaspora. From 7-9 October 2022, Ronnie hosted the first New England Business Expo & Investment Summit at the Boston Burlington Marriott hotel.", 
    ),

    Speakers(
      id: '2', 
      name: 'Solomon Serwanjja', 
      image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2022/04/Solomon_se_00-270x216.jpg', 
      title: 'Executive Director, African Institute for Investigative Journalism',  
      twitter: 'https://twitter.com/intent/tweet?text=Solomon%20Serwanjja%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fsolomon-serwanjja%2F&related=AddToAny,micropat', 
      facebook: 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fsolomon-serwanjja%2F&t=Solomon%20Serwanjja&quote=Solomon%20Serwanjja%20is%20a%20Ugandan%20award-winning%20investigative%20journalist%20and%20the%20Executive%20Director%20of%20the%20African%20Institute%20for%20Investigative%20Journalism.%20He%20holds%20a%20Master%E2%80%99s%20Degree%20in%20Journalism%20and%20communication%20from%20Makerere%20University.%20In%202019%2C%20Mr.%20Serwanjja%20won%20the%20BBC%20Komla%20Dumor%20Award%2C%20a%20prestigious%20honor%20for%20Africa%E2%80%99s%20top%20journalist%20of%20the%20year.%20He%20has%20an%20incremental%20experience%20of%2014%20years%20in%20investigative%20reporting%20and%20broadcast%20journalism%20as%20a%20whole%20has%20worked%20with%20national%2C%20regional%2C%20and%20international%20media.',
      description: "Solomon Serwanjja is a Ugandan award-winning investigative journalist and the Executive Director of the African Institute for Investigative Journalism. He holds a Master’s Degree in Journalism and communication from Makerere University. In 2019, Mr. Serwanjja won the BBC Komla Dumor Award, a prestigious honor for Africa’s top journalist of the year. He has an incremental experience of 14 years in investigative reporting and broadcast journalism as a whole has worked with national, regional, and international media.",
      ),

      Speakers(
        id: '3', 
        name: 'Judge Rochelle Ivri', 
        image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2020/07/Judge_Rochelle_Ivri.jpg', 
        title: 'Key Note Speaker',  
        twitter: 'https://twitter.com/intent/tweet?text=Judge%20Rochelle%20Ivri%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fjudge-rochelle-ivri-2%2F&related=AddToAny,micropat', 
        facebook: 'https://www.addtoany.com/add_to/facebook?linkurl=http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fjudge-rochelle-ivri-2%2F&linkname=Judge%20Rochelle%20Ivri&linknote=',
        description: 'Judge Rochelle Ivri is one of ten citizenship judges in Canada and a paralegal professor at Mohawk College in Hamilton. She has a degree in Criminology from the University of Windsor, a post-graduate certificate in Alternative Dispute Resolution from York University and has co-authored the textbook, Tribunal Practice, and Procedure for Legal Professionals. Rochelle was the',
        ),

        Speakers(
          id: '4', 
          name: 'Justus Mirembe', 
          image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2020/01/justus-e1578220083207-270x216.jpg', 
          title: 'Co-Chair Uganda Canadian Business Expo & Convention',  
          twitter: 'https://twitter.com/intent/tweet?text=Justus%20Mirembe%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fjustus-mirembe%2F&related=AddToAny,micropat', 
          facebook: 'https://www.addtoany.com/add_to/facebook?linkurl=http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fjustus-mirembe%2F&linkname=Justus%20Mirembe&linknote=Co-Chair%20Uganda%20Canadian%20Business%20Expo%20%26%20Convention',
          description: "Justus Mirembe has lived and worked in Vancouver British Columbia, Canada for almost 20 years. His educational background is in Forensic Criminology, majoring in Crime and Intelligence from both Douglas College and the British Columbia Institute of Technology (BCIT). Justus has worked for the Canadian Federal Government for 17 years. He is currently a member of a select specialized Federal Armed Elite Unit specializing in enforcement of Inter-Provincial and International Trade in Endangered Species of Flora and Fauna. Canada and Uganda are among over 180 countries that are signatories of the Convention on International Trade in Endangered Species (CITES) and part of Justus’s duties are to enforce the export and import and illegal trade of wildlife. You may run into Justus at any major Canadian point of entries specifically at airports and border crossing", 
          ),
          
          Speakers(
            id: '5',
            name: 'Susan Namulindwa',
            image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2021/05/Trademark--571x350.jpg', 
            title: 'Founder & Executive Director of Africa Trade Desk Canada',          
            twitter: 'https://twitter.com/intent/tweet?text=Solomon%20Serwanjja%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fsolomon-serwanjja%2F&related=AddToAny,micropat', 
            facebook: 'https://twitter.com/intent/tweet?text=Ronnie%20Mayanja%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2Fteams%2Fronnie-mayanja%2F&related=AddToAny,micropat',
            description: "Susan is the Founder and Executive Director of Africa Trade Desk, the Vice President Canada-Africa Chamber of Business and Board Chair of the Afro Canadian Chamber of Commerce. She is a seasoned, client-focused, and results-oriented executive, with a twenty-five year plus track record of management, mobilizing partners, teams, and stakeholders with often competing interests to solve problems and achieve measurable results. She has an in-depth expertise and knowledge in building team resiliency, leading consultations among diverse stakeholders around the world with reference to agenda setting, strategic vision on sustainable development, trade, delivering on new change, project management and small and medium sized enterprises.",
            ),

            Speakers(
              id: '6', 
              name: 'Prof. Lumumba Stanislaus', 
              image: 'http://www.ugandacanadaconvention.com/wp-content/uploads/2021/04/PLO-Lumumba-e1619137546165-600x350.jpeg', 
              title: 'Founder & Chairman of the PLO Lumumba Foundation – Convention Keynote Speaker',  
              twitter: 'https://twitter.com/intent/tweet?text=Prof.%20Lumumba%20%7C%20Founder%20%26%20Chairman%20of%20the%20PLO%20Lumumba%20Foundation%20%E2%80%93%20Convention%20Keynote%20Speaker%20http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2F2021%2F04%2F23%2Fprof-lumumba-founder-ceo-of-the-plo-lumumba-foundation-convention-keynote-speaker%2F&related=AddToAny,micropat', 
              facebook: 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.ugandacanadaconvention.com%2Findex.php%2F2021%2F04%2F23%2Fprof-lumumba-founder-ceo-of-the-plo-lumumba-foundation-convention-keynote-speaker%2F&t=Prof.%20Lumumba%20%7C%20Founder%20%26%20Chairman%20of%20the%20PLO%20Lumumba%20Foundation%20%E2%80%93%20Convention%20Keynote%20Speaker&quote=Founder%20%26%20Chairman%20of%20the%20PLO%20Lumumba%20Foundation%20%E2%80%93%20Convention%20Keynote%20Speaker',
              description: 'Professor PLO Lumumba is the Founder of the PLO Lumumba Foundation and a consultant with Lumumba and Lumumba Advocates, a member of the Africa Justice Group (AJG). He is an Advocate of the High Courts of Kenya and Tanganyika and a certified mediator. He is a Fellow of the Institute of Certified Public Secretaries of Kenya FCPS (K), a Fellow of the Kenya Institute of Management (FKIM) and Honorary Fellow of the African Academy of Sciences (FAAS). He is the Chairman of Farafina Investment Group in Monrovia, Liberia and Economic Strategic Growth and Development Initiative for Africa based in Nigeria. He has authored several books on diverse subjects. With several speeches on diverse subjects delivered in and outside Africa, Lumumba is recognized as one of the leading public speakers in Africa and the African in Diaspora. He is the founder of several organizations including the PLO Lumumba Foundation, a charitable organization that has been in operation since 1990. He has also been twice recognized as one of the 100 most influential Africans.',
              )

];