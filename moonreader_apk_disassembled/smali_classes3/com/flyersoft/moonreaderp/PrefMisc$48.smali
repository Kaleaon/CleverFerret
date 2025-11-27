.class Lcom/flyersoft/moonreaderp/PrefMisc$48;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb1:Landroid/widget/CheckBox;

.field final synthetic val$cb2:Landroid/widget/CheckBox;

.field final synthetic val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1349
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb1:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb2:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1352
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smSDK23()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1353
    sput-boolean p2, Lcom/flyersoft/tools/A;->fullscreen:Z

    .line 1354
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;

    const p2, -0x777778

    if-eqz p1, :cond_1

    .line 1355
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    invoke-virtual {p1, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setEnabled(Z)V

    .line 1356
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb1:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->getColor()I

    move-result v0

    goto :goto_0

    :cond_0
    const v0, -0x777778

    :goto_0
    invoke-virtual {p1, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setTextColor(I)V

    .line 1358
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb2:Landroid/widget/CheckBox;

    if-eqz p1, :cond_3

    .line 1359
    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1360
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb2:Landroid/widget/CheckBox;

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v0, :cond_2

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$48;->val$cb1:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p2}, Landroid/text/TextPaint;->getColor()I

    move-result p2

    :cond_2
    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setTextColor(I)V

    :cond_3
    return-void

    .line 1363
    :cond_4
    sput-boolean p2, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    return-void
.end method
