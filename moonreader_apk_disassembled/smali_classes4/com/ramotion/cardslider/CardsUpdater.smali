.class public Lcom/ramotion/cardslider/CardsUpdater;
.super Lcom/ramotion/cardslider/DefaultViewUpdater;
.source "CardsUpdater.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/ramotion/cardslider/DefaultViewUpdater;-><init>()V

    return-void
.end method


# virtual methods
.method public updateView(Landroid/view/View;F)V
    .locals 1

    .line 14
    invoke-super {p0, p1, p2}, Lcom/ramotion/cardslider/DefaultViewUpdater;->updateView(Landroid/view/View;F)V

    const/4 v0, 0x0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_0

    .line 17
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getAlpha(Landroid/view/View;)F

    move-result p2

    const v0, 0x3e99999a    # 0.3f

    add-float/2addr p2, v0

    .line 19
    invoke-static {p1, p2}, Landroidx/core/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    return-void

    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 21
    invoke-static {p1, p2}, Landroidx/core/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    return-void
.end method
