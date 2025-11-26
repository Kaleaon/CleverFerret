.class Lcom/flyersoft/moonreaderp/ActivityTxt$165;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showDictHistory()V
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

    .line 16261
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$165;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 16264
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$165;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/tools/A;->dict_index:I

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->getDictUrl(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getDcitHistory()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p1, v0, p2, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->openDictUrl(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method
