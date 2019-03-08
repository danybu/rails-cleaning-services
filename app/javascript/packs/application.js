import "bootstrap";
import { hoverCard } from './hover-card';
import { star_rating } from './star_rating';
import { initMapbox } from './mapboxgl';
import { cleaner_banner } from './cleaner_banner';
import { dayPartChooser, dayChooser } from './day-part-chooser';


star_rating();
hoverCard();
initMapbox();
cleaner_banner();
dayChooser();
dayPartChooser();
