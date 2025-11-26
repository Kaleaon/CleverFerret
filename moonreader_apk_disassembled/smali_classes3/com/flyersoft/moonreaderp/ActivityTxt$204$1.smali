.class Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$204;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

.field final synthetic val$result:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$204;Ljava/lang/String;)V
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

    .line 19269
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->val$result:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 19272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->val$result:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 19273
    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyUnRar;->isRAR5Exception(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 19274
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v2, "UnsupportedRarV5Exception"

    const-string v3, "Please use CBZ comic book, or use RAR4 to make CBR comic book."

    invoke-static {v0, v2, v3, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    .line 19276
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->val$result:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->val$result:Ljava/lang/String;

    :goto_0
    invoke-static {v0, v2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void

    .line 19278
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$204;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf_filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcbzOpen2(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    return-void
.end method
