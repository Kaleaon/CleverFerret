.class public final Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;
.super Lcom/dropbox/core/util/Dumpable;
.source "DbxEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxEntry$File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PhotoInfo"
.end annotation


# static fields
.field public static final PENDING:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

.field public static Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

.field public final timeTaken:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 393
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo$1;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 418
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;-><init>(Ljava/util/Date;Lcom/dropbox/core/v1/DbxEntry$File$Location;)V

    sput-object v0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->PENDING:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Lcom/dropbox/core/v1/DbxEntry$File$Location;)V
    .locals 0

    .line 388
    invoke-direct {p0}, Lcom/dropbox/core/util/Dumpable;-><init>()V

    .line 389
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->timeTaken:Ljava/util/Date;

    .line 390
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

    return-void
.end method


# virtual methods
.method protected dumpFields(Lcom/dropbox/core/util/DumpWriter;)V
    .locals 2

    .line 423
    const-string v0, "timeTaken"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->timeTaken:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/util/Date;)Lcom/dropbox/core/util/DumpWriter;

    .line 424
    const-string v0, "location"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object p1

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->v(Lcom/dropbox/core/util/Dumpable;)Lcom/dropbox/core/util/DumpWriter;

    return-void
.end method

.method public equals(Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;)Z
    .locals 4

    .line 436
    sget-object v0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->PENDING:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_3

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->timeTaken:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->timeTaken:Ljava/util/Date;

    invoke-static {v0, v3}, Lcom/dropbox/core/util/LangUtil;->nullableEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    .line 438
    :cond_1
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

    iget-object p1, p1, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

    invoke-static {v0, p1}, Lcom/dropbox/core/util/LangUtil;->nullableEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    return v2

    :cond_2
    return v1

    :cond_3
    :goto_0
    if-ne p1, p0, :cond_4

    return v1

    :cond_4
    return v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 430
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->equals(Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 2

    .line 446
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->timeTaken:Ljava/util/Date;

    invoke-static {v0}, Lcom/dropbox/core/util/LangUtil;->nullableHashCode(Ljava/lang/Object;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 447
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->location:Lcom/dropbox/core/v1/DbxEntry$File$Location;

    invoke-static {v1}, Lcom/dropbox/core/util/LangUtil;->nullableHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
