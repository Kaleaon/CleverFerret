.class Lcom/flyersoft/moonreaderp/PrefFontPick$2;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 96
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 3

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->phTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->phTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    const-string v2, ""

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchFont(Ljava/lang/String;)V

    return v1
.end method
