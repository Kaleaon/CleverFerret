.class Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;


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

    .line 797
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;)V
    .locals 1

    .line 800
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->getView(ILandroid/view/View;)V

    return-void
.end method
