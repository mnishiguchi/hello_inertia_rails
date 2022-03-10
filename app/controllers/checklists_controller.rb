class ChecklistsController < ApplicationController
  # GET /checklists
  def index
    render inertia: 'Checklist/Index', props: {
      checklists: Checklist.all.map do |checklist|
        checklist.as_json(only: [:id, :name]).merge(
          url: checklist_path(checklist)
        )
      end,
      new_checklist_url: new_checklist_url
    }
  end

  # GET /checklists/:id
  def show
    checklist = Checklist.includes(:checklist_items).find(params[:id])

    render inertia: 'Checklist/Show', props: {
      checklist: checklist.as_json(only: [:id, :name]).merge(
        url: checklist_path(checklist),
        checklist_items_url: checklist_checklist_items_path(checklist),
      ),
      checklist_items: checklist.checklist_items.map do |checklist_item|
        checklist_item.as_json(only: [:id, :name, :checked]).merge(
          url: checklist_checklist_item_path(checklist, checklist_item)
        )
      end
    }
  end

  # GET /checklists/new
  def new
    render inertia: 'Checklist/New', props: {
      checklists_url: checklists_url
    }
  end

  # POST /checklists
  def create
    checklist = Checklist.new(checklist_params)

    if checklist.save
      flash[:notice] = "Checklist was created successfully"
      redirect_to checklist_url(checklist)
    else
      flash[:alert] = checklist.errors.full_messages.join(", ")
      redirect_to new_checklist_url(checklist, inertia: { errors: checklist.errors.as_json })
    end
  end

  # GET /checklists/:id/edit
  def edit
    checklist = Checklist.find(params[:id])

    render inertia: 'Checklist/Edit', props: {
      checklist: checklist.as_json(only: [:id, :name]).merge(
        url: checklist_path(checklist),
      )
    }
  end

  # PATCH /checklists/:id
  def update
    checklist = Checklist.find(params[:id])

    if checklist.update(checklist_params)
      flash[:notice] = "Checklist was updated successfully"
      redirect_to checklist_url(checklist)
    else
      flash[:alert] = checklist.errors.full_messages.join(", ")
      redirect_to edit_checklist_url(checklist, inertia: { errors: checklist.errors.as_json })
    end
  end

  # DELETE /checklists/:id
  def destroy
    Checklist.find(params[:id]).destroy
    flash[:notice] = "Checklist was deleted successfully"
    redirect_to checklists_url
  end

  private

  def checklist_params
    params.require(:checklist).permit!
  end
end
