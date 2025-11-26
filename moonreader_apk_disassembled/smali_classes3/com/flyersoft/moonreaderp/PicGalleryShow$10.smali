.class Lcom/flyersoft/moonreaderp/PicGalleryShow$10;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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

    .line 1099
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$10;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1102
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$10;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v1, p1, v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    return-void
.end method
