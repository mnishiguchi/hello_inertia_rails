module Checklists
  class ChecklistItemsController < ApplicationController
    before_action :correct_checklist

    # POST /checklists/:checklist_id/checklist_items
    def create
      checklist_item = @checklist.checklist_items.build(checklist_item_params)

      if checklist_item.save
        flash[:notice] = "Checklist item was created successfully"
        redirect_to checklist_url(@checklist)
      else
        flash[:alert] = checklist_item.errors.full_messages.join(", ")
        redirect_to checklist_url(@checklist), inertia: { errors: checklist_item.errors.as_json }
      end
    end

    def edit
      checklist_item = @checklist.checklist_items.find(params[:id])

      render inertia: 'Checklist/ChecklistItem/Edit', props: {
        checklist_item: checklist_item.as_json(only: [:id, :name]).merge(
          url: checklist_checklist_item_path(@checklist, checklist_item),
        )
      }
    end

    # PATCH /checklists/:checklist_id/checklist_items/:id
    def update
      checklist_item = @checklist.checklist_items.find(params[:id])

      if checklist_item.update(checklist_item_params)
        redirect_to checklist_url(@checklist)
      else
        flash[:alert] = checklist_item.errors.full_messages.join(", ")
        redirect_to edit_checklist_checklist_item_url(@checklist), inertia: { errors: checklist_item.errors.as_json }
      end
    end

    # DELETE /checklists/:checklist_id/checklist_items/:id
    def destroy
      ChecklistItem.find(params[:id]).destroy
      flash[:notice] = "Checklist item was deleted successfully"
      redirect_to checklist_url(@checklist)
    end

    private

    def correct_checklist
      @checklist = Checklist.find(params[:checklist_id])
    end

    def checklist_item_params
      params.require(:checklist_item).permit!
    end
  end
end
