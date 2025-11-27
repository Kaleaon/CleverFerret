.class Lcom/flyersoft/moonreaderp/PrefMisc$51;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showImageOptions(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb0:Landroid/widget/CheckBox;

.field final synthetic val$cb1:Landroid/widget/CheckBox;

.field final synthetic val$cb2:Landroid/widget/CheckBox;

.field final synthetic val$cb3:Landroid/widget/CheckBox;

.field final synthetic val$cb4:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1425
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb0:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb1:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb2:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb3:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb4:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1428
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb0:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->reduceImageBrightness:Z

    .line 1429
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb1:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    .line 1430
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->fitImageToScreen:Z

    .line 1431
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb3:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->longTapImageFullScreen:Z

    .line 1432
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$51;->val$cb4:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    .line 1433
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_0

    .line 1434
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1435
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_1

    .line 1436
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    :cond_1
    return-void
.end method
