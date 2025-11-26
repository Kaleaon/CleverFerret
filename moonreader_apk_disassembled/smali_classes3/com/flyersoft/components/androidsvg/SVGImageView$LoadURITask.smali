.class Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;
.super Landroid/os/AsyncTask;
.source "SVGImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/SVGImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadURITask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/io/InputStream;",
        "Ljava/lang/Integer;",
        "Lcom/flyersoft/components/androidsvg/SVG;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;


# direct methods
.method private constructor <init>(Lcom/flyersoft/components/androidsvg/SVGImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 300
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVGImageView-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;-><init>(Lcom/flyersoft/components/androidsvg/SVGImageView;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 5

    const-string v0, "Parse error loading URI: "

    const/4 v1, 0x0

    .line 306
    :try_start_0
    aget-object v2, p1, v1

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/SVG;->getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object v0
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    :try_start_1
    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v2

    .line 310
    :try_start_2
    const-string v3, "SVGImageView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/SVGParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 316
    :try_start_3
    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    const/4 p1, 0x0

    return-object p1

    :goto_0
    :try_start_4
    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 319
    :catch_3
    throw v0
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

    .line 299
    check-cast p1, [Ljava/io/InputStream;

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->doInBackground([Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/flyersoft/components/androidsvg/SVG;)V
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

    invoke-static {v0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->-$$Nest$fputsvg(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVG;)V

    .line 326
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->this$0:Lcom/flyersoft/components/androidsvg/SVGImageView;

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

    .line 299
    check-cast p1, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->onPostExecute(Lcom/flyersoft/components/androidsvg/SVG;)V

    return-void
.end method
