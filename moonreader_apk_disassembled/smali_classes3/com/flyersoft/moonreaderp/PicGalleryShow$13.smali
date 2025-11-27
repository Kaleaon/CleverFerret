.class Lcom/flyersoft/moonreaderp/PicGalleryShow$13;
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


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1192
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$13;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1194
    sput-boolean p2, Lcom/flyersoft/tools/A;->galleryShowStatusbar:Z

    .line 1195
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$13;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    sget-boolean p2, Lcom/flyersoft/tools/A;->galleryShowStatusbar:Z

    if-nez p2, :cond_0

    const/16 p2, 0x8

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 1196
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$13;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mupdateBarTime(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    return-void
.end method
