EBIRD
=====

Beschreibung
------------
Ebird ist eine Sammlung von Anleitungen und Software-Tools zum Bau eines
Nistkastens mit Videoüberwachung des Nistkasten-Inneren. Dadurch können
die nistenden Vögel beobachtet werden. Die Elektronik des Niskastens basiert
auf einem Raspbery Pi mit dem Betriebssystem Raspbian. An dem Raspberry Pi
ist eine RasPi-Kamera angeschlossen.

Features
--------
* Beobachtung des Nistkastens mit einer RasPi Kamera
* WiFi Acces Point (hostapd)
* Livestream der Kamera via http (motion)
* Bewegungsgesteuerte Erzeugung von Bildern und Videos (motion)

Ausbau-Pläne
------------
* Logging von Umweltparametern, wie Temperatur, Luftfeuchte

Installation
------------
Die Reihenfolge der Top-Level Ordner im Repository gibt einen Vorschlag für
die Reihenfolge der Konfiguration des Raspbery Pi vor, beginnend mit dem
Aufsetzen und der Konfiguration des Grundsystems in 00_system. In jedem
Top-Level-Ordner befindet sich ein Unterordner doc/ mit Anleitungen für den
jeweiligen Schritt.
