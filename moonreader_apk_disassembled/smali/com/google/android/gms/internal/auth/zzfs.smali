.class final Lcom/google/android/gms/internal/auth/zzfs;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth-base@@18.0.4"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/auth/zzfr;

.field private static final zzb:Lcom/google/android/gms/internal/auth/zzfr;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    .line 1
    :try_start_0
    const-string v1, "com.google.protobuf.MapFieldSchemaFull"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 2
    invoke-virtual {v1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/auth/zzfr;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :catch_0
    sput-object v0, Lcom/google/android/gms/internal/auth/zzfs;->zza:Lcom/google/android/gms/internal/auth/zzfr;

    new-instance v0, Lcom/google/android/gms/internal/auth/zzfr;

    invoke-direct {v0}, Lcom/google/android/gms/internal/auth/zzfr;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/auth/zzfs;->zzb:Lcom/google/android/gms/internal/auth/zzfr;

    return-void
.end method

.method static zza()Lcom/google/android/gms/internal/auth/zzfr;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/auth/zzfs;->zza:Lcom/google/android/gms/internal/auth/zzfr;

    return-object v0
.end method

.method static zzb()Lcom/google/android/gms/internal/auth/zzfr;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/auth/zzfs;->zzb:Lcom/google/android/gms/internal/auth/zzfr;

    return-object v0
.end method
