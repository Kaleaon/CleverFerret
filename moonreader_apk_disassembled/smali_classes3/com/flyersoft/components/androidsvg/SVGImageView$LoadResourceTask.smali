.class Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;
.super Landroid/os/AsyncTask;
.source "SVGImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/SVGImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadResourceTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Lcom/flyersoft/components/androidsvg/SVG;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/SVGImageView;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 273
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 274
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 3

    const/4 v0, 0x0

    .line 279
    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 282
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/SVG;->getFromResource(Landroid/content/Context;I)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v1

    .line 286
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/SVGParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v0

    const/4 p1, 0x1

    aput-object v1, v2, p1

    const-string p1, "Error loading resource 0x%x: %s"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "SVGImageView"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 267
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->doInBackground([Ljava/lang/Integer;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/flyersoft/components/androidsvg/SVG;)V
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

    invoke-static {v0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->-$$Nest$fputsvg(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVG;)V

    .line 294
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->-$$Nest$mdoRender(Lcom/flyersoft/components/androidsvg/SVGImageView;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 267
    check-cast p1, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->onPostExecute(Lcom/flyersoft/components/androidsvg/SVG;)V

    return-void
.end method
