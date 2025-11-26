.class Lcom/flyersoft/moonreaderp/PicGalleryShow$12;
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

    .line 1184
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$12;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1186
    sput-boolean p2, Lcom/flyersoft/tools/A;->keepScreenAwakePic:Z

    .line 1187
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$12;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->baseFrame:Landroid/widget/FrameLayout;

    sget-boolean p2, Lcom/flyersoft/tools/A;->keepScreenAwakePic:Z

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setKeepScreenOn(Z)V

    return-void
.end method
