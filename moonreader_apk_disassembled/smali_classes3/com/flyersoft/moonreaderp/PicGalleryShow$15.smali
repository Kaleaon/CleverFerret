.class Lcom/flyersoft/moonreaderp/PicGalleryShow$15;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

.field final synthetic val$brightAutoCheck:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1211
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;->val$brightAutoCheck:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_0

    .line 1219
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    const/4 p3, 0x1

    add-int/2addr p2, p3

    invoke-virtual {p1, p2, p3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setScreenBrightness(IZ)V

    .line 1220
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;->val$brightAutoCheck:Landroid/widget/CheckBox;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
