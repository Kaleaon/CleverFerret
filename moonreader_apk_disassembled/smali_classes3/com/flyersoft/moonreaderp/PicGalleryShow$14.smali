.class Lcom/flyersoft/moonreaderp/PicGalleryShow$14;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

.field final synthetic val$sb1:Landroid/widget/SeekBar;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/SeekBar;)V
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

    .line 1200
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$14;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$14;->val$sb1:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    if-eqz p2, :cond_0

    const/16 p1, -0x64

    .line 1203
    sput p1, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    .line 1204
    sget-object p2, Lcom/flyersoft/moonreaderp/PicGalleryShow;->selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setScreenBrightness(IZ)V

    return-void

    .line 1206
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$14;->val$sb1:Landroid/widget/SeekBar;

    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    const/4 v0, 0x1

    add-int/2addr p2, v0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setScreenBrightness(IZ)V

    return-void
.end method
