import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/model/info_response.dart';
import 'package:sizer/sizer.dart';

extension SizerMainTest on MaterialApp {
  Sizer get sizerMainTest => Sizer(builder: (context, orientation, deviceType) {
        return this;
      });
}

InfoResponse mockInfoResponse() => InfoResponse.fromJson([
      {
        "synopsis":
            "Philip J. Fry is a 25 year old delivery boy living in New York City who is cryogenically frozen on New Year's 1999 for 1000 years, where he wakes up in New New York City on December 31, 2999. There, he meets Turanga Leela, a tough but loving, beautiful one-eyed alien; and Bender, an alcohol-powered bending robot who is addicted to liquor, cigars, stealing, amongst other things. Eventually, they all meet up with Fry's Great, Great, Great, etc... Nephew, Hubert J. Farnsworth. Farnsworth is a very old man who is a genius but is very senile and forgetful. Fry, Leela, and Bender wind up working for Farnsworth's Planet Express Delivery Service. They then meet their co-workers; Amy Wong, who is a Martian intern who comes from a rich family, but is still a human who is very hip. Also, there is Hermes Conrad, who manages the delivery service and is pretty strict. Hermes seems Jamaican in voice and look. And finally, there's Dr. John Zoidberg, a lobster-like alien who is the crew's doctor. Unfortunately, he knows nothing about humans. Fry, Leela, Bender, and sometimes Amy and Dr. Zoidberg travel around the universe risking life and limb delivering packages and performing charitable tasks for tax deductions.",
        "yearsAired": "1999–2013",
        "creators": [
          {
            "name": "David X. Cohen",
            "url": "http://www.imdb.com/name/nm0169326"
          },
          {"name": "Matt Groening", "url": "http://www.imdb.com/name/nm0004981"}
        ],
        "id": 1
      }
    ]);
