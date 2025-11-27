.class Lcom/flyersoft/moonreaderp/ActivityTxt$121;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showPrefSearch(Ljava/lang/String;)V
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

    .line 12737
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$121;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 12739
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$121;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoPrefSearchResult(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V

    return-void
.end method
