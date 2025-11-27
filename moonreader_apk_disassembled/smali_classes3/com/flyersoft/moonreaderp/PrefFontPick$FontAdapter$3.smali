.class Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$3;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 900
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 903
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefFontPick;Landroid/view/View;I)V

    return-void
.end method
