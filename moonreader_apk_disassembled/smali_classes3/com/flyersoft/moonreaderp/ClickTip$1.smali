.class Lcom/flyersoft/moonreaderp/ClickTip$1;
.super Ljava/lang/Object;
.source "ClickTip.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ClickTip;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ClickTip;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ClickTip;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ClickTip$1;->this$0:Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 44
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1()I

    move-result v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    const/4 v1, 0x0

    .line 45
    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/graphics/Insets;)I

    move-result v0

    invoke-virtual {p1, v1, v1, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p2
.end method
