.class Lcom/flyersoft/moonreaderp/PrefVisual$32;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

.field final synthetic val$italic:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V
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

    .line 1062
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->val$italic:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTheme(Ljava/lang/String;)V
    .locals 1

    .line 1065
    invoke-static {p1}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;)V

    .line 1066
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeOfBook(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    .line 1067
    const-string p1, "circle_only"

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    .line 1068
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mloadSettings(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1069
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowBackgroundTypeIndicator(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1070
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->val$italic:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eq p1, v0, :cond_1

    .line 1071
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1072
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$32;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
