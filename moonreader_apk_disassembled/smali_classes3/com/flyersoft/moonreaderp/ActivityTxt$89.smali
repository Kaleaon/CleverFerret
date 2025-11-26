.class Lcom/flyersoft/moonreaderp/ActivityTxt$89;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_go_percent()V
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

    .line 10147
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 10149
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->total_pages:I

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->show()V

    return-void
.end method
