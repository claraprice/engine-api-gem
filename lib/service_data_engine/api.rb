require 'api_base'

module ServiceDataEngine
  class Api < ApiBase

    def drg(number)
      request('drgs', number)
    end

    def drgs
      request('drgs')
    end

    def group_drg(estimate)
      post_request('drgs/group', estimate.attributes)
    end

    def common_drgs
      request('drgs/common')
    end

    def body_systems
      request('body_systems')
    end

    def body_system(id)
      request('body_systems', id)
    end

    def mdcs
      require('mdcs')
    end

    def mdc_mdc_classes(mdc_number, type='medical')
      request("mdcs/#{mdc_number}/mdc_classes/#{type}")
    end

    def mdc_class(id)
      request('mdc_classes', id)
    end

    def mdc_class_by_name(name)
      request("mdc_classes?name=#{name.strip}")
    end

    def common_mdc_classes
      request('mdc_classes/common')
    end

    def diagnosis(code)
      request("diagnoses/#{code}")
    end

    def diagnosis_mdc_classes(diagnosis_code, type='medical')
      request("diagnoses/#{diagnosis_code}/mdc_classes/#{type}")
    end

    def condition(id)
      request("conditions/#{id}")
    end

    def sub_condition(id)
      request("sub_conditions/#{id}")
    end

    def body_system_mdc_classes(body_system_id, type='medical')
      request("body_systems/#{body_system_id}/mdc_classes/#{type}")
    end

    def body_system_diagnoses(body_system_id)
      request("body_systems/#{body_system_id}/diagnoses")
    end

    def body_system_conditions(body_system_id)
      request("body_systems/#{body_system_id}/conditions")
    end

  end
end

