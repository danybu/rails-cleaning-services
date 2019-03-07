import "bootstrap";
import { hoverCard } from './hover-card';
import { star_rating } from './star_rating';
import { initMapbox } from './mapboxgl';
import { dayPartChooser, dayChooser } from './day-part-chooser';

star_rating();
hoverCard();
initMapbox();
dayChooser();
dayPartChooser();
