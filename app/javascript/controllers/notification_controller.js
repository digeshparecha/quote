import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notificationBadge", "notificationItem"];
  allNotificationConnected = false

  connect() {
    this.allNotificationConnected = true
    this.checkBedgeVisiblity();
  }

  checkBedgeVisiblity() {
    if (this.notificationItemTargets.length > 0){
      this.notificationBadgeTarget.classList.remove("visually-hidden");
    }else{
      this.notificationBadgeTarget.classList.add("visually-hidden");
    }
  }

  notificationItemTargetConnected(element){
    if (this.allNotificationConnected){
      this.checkBedgeVisiblity();
    }
  }

  notificationItemTargetDisconnected(element){
    this.checkBedgeVisiblity();
  }

}
