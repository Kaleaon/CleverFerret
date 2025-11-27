.class Lcom/flyersoft/books/Epub$1;
.super Ljava/lang/Object;
.source "Epub.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Epub;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Epub;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 133
    iput-object p1, p0, Lcom/flyersoft/books/Epub$1;->this$0:Lcom/flyersoft/books/Epub;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;)I
    .locals 2

    .line 136
    iget-object v0, p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->folder:Ljava/lang/String;

    iget-object v1, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    iget-object p1, p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 138
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->folder:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->folder:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 133
    check-cast p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    check-cast p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/Epub$1;->compare(Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;)I

    move-result p1

    return p1
.end method
