.class Lcom/flyersoft/components/cloud/Gdrive$10;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;)V
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

    .line 816
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 3

    .line 819
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->val$con:Landroid/content/Context;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 820
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 822
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$10;->val$con:Landroid/content/Context;

    sget-object v1, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/cloud/Gdrive;->dir(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
