from .models import TouristicContent, TouristicEvent
from geotrek.common.forms import CommonForm


class TouristicContentForm(CommonForm):
    geomfields = ['geom']

    class Meta:
        fields = ['name', 'category', 'type1', 'type2', 'published',
                  'description_teaser', 'description', 'themes', 'contact',
                  'email', 'website', 'practical_info', 'geom']
        model = TouristicContent

    def __init__(self, *args, **kwargs):
        super(TouristicContentForm, self).__init__(*args, **kwargs)
        # Since we use chosen() in trek_form.html, we don't need the default help text
        for f in ['themes', 'type1', 'type2']:
            self.fields[f].help_text = ''


class TouristicEventForm(CommonForm):
    geomfields = ['geom']

    class Meta:
        fields = ['name', 'published', 'description_teaser', 'description',
                  'themes', 'begin_date', 'end_date', 'duration',
                  'meeting_point', 'meeting_time', 'contact', 'email',
                  'website', 'organizer', 'speaker', 'usage', 'accessibility',
                  'participant_number', 'booking', 'public', 'practical_info',
                  'geom']
        model = TouristicEvent

    def __init__(self, *args, **kwargs):
        super(TouristicEventForm, self).__init__(*args, **kwargs)
        self.fields['begin_date'].widget.attrs['placeholder'] = 'yyyy-mm-dd'
        self.fields['end_date'].widget.attrs['placeholder'] = 'yyyy-mm-dd'
        self.fields['meeting_time'].widget.attrs['placeholder'] = 'HH:MM'
        # Since we use chosen() in trek_form.html, we don't need the default help text
        for f in ['themes']:
            self.fields[f].help_text = ''
