.class Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;
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

    .line 891
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 894
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 895
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selectedFont:Ljava/lang/String;

    .line 896
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->dismiss()V

    return-void
.end method
