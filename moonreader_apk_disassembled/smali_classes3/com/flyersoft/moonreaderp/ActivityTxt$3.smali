.class Lcom/flyersoft/moonreaderp/ActivityTxt$3;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 289
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$3;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$3;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->statusBarInsets:Landroid/graphics/Insets;

    .line 294
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$3;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->navigationBarInsets:Landroid/graphics/Insets;

    .line 295
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$3;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2()I

    move-result v1

    invoke-static {p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->cutoutInsets:Landroid/graphics/Insets;

    .line 296
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$3;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetAndroid15Insets(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    return-object p2
.end method
