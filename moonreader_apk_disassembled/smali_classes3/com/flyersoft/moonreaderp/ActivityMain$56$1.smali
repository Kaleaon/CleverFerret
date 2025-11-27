.class Lcom/flyersoft/moonreaderp/ActivityMain$56$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/tools/T$FileResultOK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$56;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$56;

.field final synthetic val$lkey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$56;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 5205
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$56;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56$1;->val$lkey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isResultOk(Ljava/lang/String;)Z
    .locals 1

    .line 5208
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56$1;->val$lkey:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->filenameMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
