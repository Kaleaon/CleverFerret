.class Lcom/flyersoft/components/cloud/WebDav$26;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 939
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$26;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$26;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$26;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 3

    .line 941
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$26;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$26;->val$con:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/WebDav;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 942
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 943
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$26;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, v2, p1}, Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;->done(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void

    .line 945
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$26;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;

    check-cast p1, Ljava/util/ArrayList;

    invoke-interface {v0, p1, v2}, Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;->done(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method
