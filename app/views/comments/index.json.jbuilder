# frozen_string_literal: true

json.array! @comments, partial: 'scomments/comment', as: :comment
