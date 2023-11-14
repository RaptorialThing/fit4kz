# frozen_string_literal: true

class TrainingDecorator < Draper::Decorator
  delegate_all

  def show_video_link
    unless video_link.empty?
      video_link
    else
      I18n.t('api.errors.trainings.no_video_link')
    end
  end

end
