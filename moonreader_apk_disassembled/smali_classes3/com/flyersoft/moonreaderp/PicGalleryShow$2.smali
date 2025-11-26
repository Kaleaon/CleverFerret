.class Lcom/flyersoft/moonreaderp/PicGalleryShow$2;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->onCreate(Landroid/os/Bundle;)V
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

    .line 147
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusBarInsets:Landroid/graphics/Insets;

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->navigationBarInsets:Landroid/graphics/Insets;

    .line 153
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cutoutInsets:Landroid/graphics/Insets;

    .line 154
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->top:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusBarInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/graphics/Insets;)I

    move-result v1

    mul-int/lit8 v1, v1, 0x5a

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->top:Ljava/lang/Integer;

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$msetAndroid15Insets(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/view/View;)V

    return-object p2
.end method
