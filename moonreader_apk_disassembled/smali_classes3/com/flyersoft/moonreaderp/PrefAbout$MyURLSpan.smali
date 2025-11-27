.class Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;
.super Landroid/text/style/ClickableSpan;
.source "PrefAbout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefAbout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyURLSpan"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefAbout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 244
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 245
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mContext:Landroid/content/Context;

    .line 246
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 250
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "click url: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 252
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mUrl:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, "donation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 253
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefAbout;->-$$Nest$mshowDonation(Lcom/flyersoft/moonreaderp/PrefAbout;)V

    return-void

    .line 254
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mUrl:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, "subscription"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 255
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefAbout;->dismiss()V

    .line 256
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 257
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showSubscriptionDlg()V

    :cond_1
    return-void

    .line 259
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;->mUrl:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->openUrl(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
